"use strict";
require('dotenv').config();
const db = require('../common/db');
const otp_fun = require('../common/otp');
const BigNumber = require('bignumber.js');

exports.setting = async(req, res) => {
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

exports.getUserDetails = async(req, res) => {
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