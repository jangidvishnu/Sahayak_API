require('dotenv').config()
const db = require('../common/db');
const Cryptr = require('cryptr');
const cryptr = new Cryptr('myTotalySecretKey');
const client = require('twilio')(cryptr.decrypt(process.env.twilio_accountSid), cryptr.decrypt(process.env.twilio_authToken));


function send_sms(to_mobile, body, subj) {
    return new Promise((resolve, reject) => {
        client.messages
            .create({
                body: body,
                from: '+12029534295',
                to: to_mobile,
            })
            .then((message) => {
                db.query("INSERT INTO `sms` (`to_mobile`, `subj`, `body`, `status`) VALUES ('" + to_mobile.toString() + "', '" + subj.toString() + "', '" + body.toString() + "', 'send successfully')");
                console.log(message);
                resolve(true);
            }, (err) => {
                db.query("INSERT INTO `sms` (`to_mobile`, `subj`, `body`, `status`) VALUES ('" + to_mobile.toString() + "', '" + subj.toString() + "', '" + body.toString() + "', 'not send')");
                console.log(err);
                resolve(false);
            });
    });
}

exports.otp_gen = async(mobile, otp, name, msg, tx_id) => {
    try {
        if (mobile != '' && otp != '') {
            let body = "\n\nHi ";
            if (name != "") body = body + name + ",";
            body += "\n\n";
            if (msg != "") body = body + msg;
            body += "\n" + otp;
            if (tx_id != "") body += "transaction_id :" + tx_id;
            if (await send_sms(mobile, body, msg)) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    } catch (err) {
        return false;
    }
};


exports.otp_verifyed = async(mobile, name, msg, tx_id) => {
    if (mobile != '') {
        let body = "\n\nHii " + name + ",\n   This sms is sent you for the perpose to notify you that an OTP is verifyed\n";
        if (msg != '') body = body + msg;
        if (tx_id != '') body = body + " Transaction ID : " + tx_id + "";
        body = body + "\nPlease contect us if not you.\nRegards,\n" + process.env.company_name + " Team \n" + process.env.mail_from + "";
        if (await send_sms(mobile, body, msg)) {
            return true;
        } else {
            return false;
        }
    } else {
        return false;
    }
};