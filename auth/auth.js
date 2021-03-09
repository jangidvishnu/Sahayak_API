"use strict";
require('dotenv').config()
const db = require('../common/db');
const otp_fun = require('../common/otp');
const jwt = require('./jwt');
const validation = require('./validation');
const sha256 = require('sha256');

exports.login = async (req, res) => {
    try {
        let aadharNumber = req.body.aadharNumber;
        let otp = req.body.otp;
        let private_key = req.body.privateKey;
        if (!aadharNumber) {
            return res.status(200).send({ success: false, msg: 'Please Enter Aadhar Number ', data: {}, errors: "" });
        }
        if (otp) {
            let userInfo = await db.query("SELECT * FROM `users` WHERE `aadhar_number` = " + db.pool.escape(aadharNumber));
            if (userInfo.length) {
                if (private_key) {
                    if (userInfo[0].can_edit_details) {
                        if (private_key != userInfo[0].edit_detail_private_key) {
                            return res.status(200).send({ success: false, msg: 'Wrong Private Key.', data: {}, errors: "" });
                        }
                    } else {
                        return res.status(200).send({ success: false, msg: 'You don\'t have access to change detais.', data: {}, errors: "" });
                    }
                }
                let sms_data = { "user_id": userInfo[0].id, "mobile": userInfo[0].mobile, "name": userInfo[0].first_name, "otp": otp };
                let verifyOtp = otp_fun.sms_otp_verify(sms_data);
                if ((await verifyOtp).success == true) {
                    let user_obj = { user_id: userInfo[0].id, aadhar_number: userInfo[0].aadhar_number };
                    if (private_key) {
                        user_obj["private_key"] = private_key;
                    }
                    const accessToken = await jwt.generateToken(user_obj);
                    if (accessToken.success == true) {
                        let user = {
                            aadhar_number: userInfo[0].aadhar_number,
                            address: userInfo[0].address,
                            can_edit_details: userInfo[0].can_edit_details,
                            city: userInfo[0].city,
                            email: userInfo[0].email,
                            first_name: userInfo[0].first_name,
                            join_time: userInfo[0].join_time,
                            last_name: userInfo[0].last_name,
                            mobile: userInfo[0].mobile,
                            state: userInfo[0].state,
                            update_time: userInfo[0].update_time,
                            zipcode: 0
                        }
                        res.status(200).json({ success: true, msg: 'Successfully logged In!', data: { user: user }, accessToken: accessToken.token, errors: '' })
                    } else {
                        res.status(200).json({ success: false, msg: 'Error in generating access Token!', data: "", errors: '' });
                    }
                } else {
                    res.status(200).json({ success: false, msg: 'Wrong OTP !!', data: "", errors: '' });
                }
            } else {
                res.status(200).send({ success: false, msg: 'User Information Not Found, Make sure you are head of your family!', data: {}, errors: "" });
            }
        } else {
            let userInfo = await db.query("SELECT * FROM `users` WHERE aadhar_number = " + db.pool.escape(aadharNumber));
            if (userInfo.length) {
                let sms_data = { "user_id": userInfo[0].id, "mobile": userInfo[0].mobile, "msg": 'OTP For login to Sahayak', "name": userInfo[0].first_name, "type": "Login_OTP" };
                let smsOtp = otp_fun.sms_otp_gen(sms_data);
                if ((await smsOtp).success == true) {
                    res.status(200).send({ success: false, msg: 'OTP sent successfully', data: {}, errors: "", otp: true });
                } else {
                    res.status(200).send({ success: false, msg: 'Error in Sending OTP', data: {}, errors: "" });
                }
            } else {
                res.status(200).send({ success: false, msg: 'User Information Not Found, Make sure you are head of your family!', data: {}, errors: "" });
            }
        }
    } catch (err) {
        console.log('in login function error');
        console.log(err);
        res.status(500).send({ success: false, msg: 'Error', data: {}, errors: err });
    }
};


exports.adminLogin = async (req, res) => {
    try {
        let username = req.body.username;
        let password = req.body.password;
        if (username=='admin123@yahoo.com' && password=='adminPass') {
            let user_obj ={ user :'admin' };
            const accessToken = await jwt.generateAdminToken(user_obj);
            if (accessToken.success == true) {
                
                res.status(200).json({ success: true, msg: 'Successfully logged In!', data: { }, accessToken: accessToken.token, errors: '' })
            } else {
                res.status(200).json({ success: false, msg: 'Error in generating access Token!', data: "", errors: '' });
            }
        } else {
            res.status(200).json({ success: false, msg: 'Wrong credentials', data: "", errors: '' });
        }
    } catch (err) {
        console.log('in adminLogin function error');
        console.log(err);
        res.status(500).send({ success: false, msg: 'Error', data: {}, errors: err });
    }
};


exports.logout = async (req, res) => {
    try {
        const authHeader = req.headers['authorization']
        const token = authHeader && authHeader.split(' ')[1];
        let user_id = req.user.user_id;
        let delete_token = await db.query("DELETE FROM `user_log` WHERE `user_log`.`user_id` = '" + user_id + "' AND `user_log`.`token` like '" + token + "';");
        if (delete_token.affectedRows) {
            res.status(200).send({ success: true, msg: 'Logout!', data: {}, errors: '' });
        } else {
            res.status(200).send({ success: false, msg: 'Error in Logout', data: {}, errors: '' });
        }
    } catch (err) {
        console.log('in logout function error');
        console.log(err);
        res.status(500).send({ success: false, msg: 'Error', data: {}, errors: err });
    }
};

exports.logout_all = async (req, res) => {
    try {
        let user_id = req.user.user_id;
        let delete_token = await db.query("DELETE FROM `user_log` WHERE `user_log`.`user_id` = '" + user_id + "';");
        if (delete_token.affectedRows) {
            let msg = 'Logout from ' + delete_token.affectedRows + ' devices';
            res.status(200).send({ success: true, msg: msg, data: {}, errors: '' });
        } else {
            res.status(200).send({ success: false, msg: 'Error in Logout', data: {}, errors: '' });
        }
    } catch (err) {
        console.log('in logout all function error');
        console.log(err);
        res.status(500).send({ success: false, msg: 'Error', data: {}, errors: err });
    }
};