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

exports.dashboard = async(req, res) => {
    try {
        let user_id = req.user.user_id;
        let announcement = await db.query("SELECT * FROM `announcement` WHERE `user_id` IS NULL AND `language` LIKE 'en' OR `user_id` = " + user_id + " AND `language` LIKE 'en' ORDER BY `id` DESC;");
        let wallet = await db.query("SELECT * FROM `wallet` WHERE `user_id` = " + user_id);
        if (wallet.length) {
            let rates = await db.query("SELECT * FROM `coin` ");
            let data = [];
            let total_usd = 0;
            rates.forEach(element => {
                let amount_usd = wallet[0][element.coin] * element.rate;
                let wallet_data = { name: element.name, symbol: element.symbol, logo: element.logo, coin: element.coin, coin_balance: wallet[0][element.coin], usd_balance: amount_usd, rate: element.rate, percentage: element.percent_change, };
                data.push(wallet_data);
                if (amount_usd > 0) total_usd += amount_usd;
            });
            res.status(200).send({ success: true, msg: '', data: { announcement: announcement, total_balance_usd: total_usd, wallet: data }, errors: '' });
        } else {
            res.status(200).send({ success: false, msg: 'User Not Found...', data: {} });
        }
    } catch (err) {
        console.log('in dashboard function error');
        console.log(err);
        res.status(500).send({ success: false, msg: 'Error', data: {}, errors: '' });
    }
};