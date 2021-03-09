"use strict";
require('dotenv').config();
const db = require('../common/db');
const multiparty = require('multiparty');
const otp_fun = require('../common/otp');
const fs = require('fs');
const BigNumber = require('bignumber.js');

exports.setting = async (req, res) => {
    try {
        let setting = await db.query("SELECT * FROM `setting`;");
        let config = await db.query("SELECT * FROM `config`;");
        res.status(200).send({ success: true, msg: '', data: { setting: setting, config: config }, errors: '' });
    } catch (err) {
        console.log('in setting function error');
        console.log(err);
        res.status(500).send({ success: false, msg: 'Error', data: {}, errors: '' });
    }
};

exports.getUserDetails = async (req, res) => {
    try {
        let user_id = req.user.user_id;
        let user = await db.query("SELECT `first_name`, `last_name`, `aadhar_number`, `can_edit_details`,  `email`, `mobile`, `join_time`, `update_time`, `address`, `city`, `state`, `zipcode` FROM `users` WHERE `id` = " + user_id);
        if (user.length) {
            res.status(200).send({ success: true, msg: '', data: { user: user[0] }, errors: '' });
        } else {
            res.status(200).send({ success: false, msg: 'User Not Found...', data: {} });
        }
    } catch (err) {
        console.log('in getUserDetails function error');
        console.log(err);
        res.status(500).send({ success: false, msg: 'Error', data: {}, errors: '' });
    }
};

exports.getMembers = async (req, res) => {
    try {
        let user_id = req.user.user_id;
        let members = await db.query("SELECT `id`, `first_name`, `last_name`, `aadhar_number`, `email`, `mobile`,`dob` FROM `members` WHERE `family_head` = " + user_id);
        if (members.length) {
            res.status(200).send({ success: true, msg: '', data: { members: members }, errors: '' });
        } else {
            res.status(200).send({ success: false, msg: 'User Not Found...', data: {} });
        }
    } catch (err) {
        console.log('in getMemebers function error');
        console.log(err);
        res.status(500).send({ success: false, msg: 'Error', data: {}, errors: '' });
    }
};

exports.getRequests = async (req, res) => {
    try {
        let requests = await db.query("SELECT request.id AS 'request_id',members.id,request.members_field,request.members_files,members.first_name,members.last_name,members.aadhar_number,members.dob,members.mobile,members.email FROM `request` JOIN `members` ON request.members=members.id WHERE request.status = 'pending'");

        if (requests.length) {
            res.status(200).send({ success: true, msg: '', data: { requests: requests }, errors: '' });
        } else {
            res.status(200).send({ success: false, msg: 'Requests  Not Found...', data: {} });
        }
    } catch (err) {
        console.log('in getRequests function error');
        console.log(err);
        res.status(500).send({ success: false, msg: 'Error', data: {}, errors: '' });
    }
};

exports.getSingleRequest = async (req, res) => {
    try {
        let req_id = req.query.id;
        let requests = await db.query("SELECT request.id AS 'request_id',members.id,request.members_field,request.members_files,members.first_name,members.last_name,members.aadhar_number,members.dob,members.mobile,members.email FROM `request` JOIN `members` ON request.members=members.id WHERE request.status = 'pending' AND request.id = " + req_id);

        if (requests.length) {
            res.status(200).send({ success: true, msg: '', data: { request: requests[0] }, errors: '' });
        } else {
            res.status(200).send({ success: false, msg: 'Requests  Not Found...', data: {} });
        }
    } catch (err) {
        console.log('in getRequests function error');
        console.log(err);
        res.status(500).send({ success: false, msg: 'Error', data: {}, errors: '' });
    }
};

exports.updateUser = async (req, res) => {
    try {
        let req_id = req.body.req_id;
        let user_id = req.body.user_id;
        let field_name = req.body.field_name;
        let field_value = req.body.field_value;

        let requests = await db.query("UPDATE `members`,`request` SET `" + (field_name)  + "` = " + db.pool.escape(field_value) + " , `status`='done' WHERE members.id = " + user_id + " AND request.id = " + req_id);

        if (requests.affectedRows) {
            res.status(200).send({ success: true, msg: '', data: {}, errors: '' });
        } else {
            res.status(200).send({ success: false, msg: 'Requests  Not Found...', data: {} });
        }
    } catch (err) {
        console.log('in getRequests function error');
        console.log(err);
        res.status(500).send({ success: false, msg: 'Error', data: {}, errors: '' });
    }
};

exports.requestEdit = async (req, res) => {
    try {
        let form = new multiparty.Form();
        let user_id = req.user.user_id;
        form.parse(req, function (err, fields, files) {

            let memberField;
            let memberFiles;
            let member = fields.member;
            let timestamp = Date.now();
            if (member) {
                member = fields.member;
                memberField = fields.member_field;
                let member_file_oldpath = files.member_file[0].path;
                let newpath1 = '..\\..\\Frontend\\sahayak\\src\\assets\\img\\docs\\' + timestamp + files.member_file[0].originalFilename;
                memberFiles = timestamp + files.member_file[0].originalFilename;
                // let newpath = '../../../var/www/html/coinscrow/assets/product_img/' + timestamp + files.product_images[0].originalFilename;;
                fs.rename(member_file_oldpath, newpath1, function (err) {
                    if (err) throw err;
                });
            }

            let query = " INSERT INTO `REQUEST` (`members`,`members_field`,`members_files`,`status`) VALUES ( '" + member + "' , '" + memberField + "','" + memberFiles + "','pending') ";
            console.log(query);
            db.query(query);
            res.status(200).send({ success: true, msg: "Request Sent Successfully", data: {}, errors: "" });
        });

    } catch (err) {
        console.log('in requestEdit function error');
        console.log(err);
        res.status(500).send({ success: false, msg: 'Error', data: {}, errors: '' });
    }
};

