"use strict";
require('dotenv').config()
const db = require('../common/db');


exports.getSchemes = async(req, res) => {
    try {
        let schemes = await db.query("SELECT * FROM `schemes`");
        res.status(200).send({success:true,data:{schemes:schemes},msg:"Fetched Schemes Successfully",errors:""});
    } catch (err) {
        console.log('in getSchemes function error');
        console.log(err);
        res.status(500).send({ success: false, msg: 'Error', data: {}, errors: err });
    }
};