"use strict";
const express = require('express');
const bodyParser = require("body-parser");
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');


const app = express();

const auth = require('./auth/auth');
const jwt = require('./auth/jwt');
const user = require('./user/user');


//Here we are configuring express to use body-parser as middle-ware.
app.use(helmet());
app.use(cors());
app.use(morgan('combined'));

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());


app.listen(3000);
console.log("RUNING NEW NODE...", Date.now());

app.get('/', (req, res) => {
    res.status(200).send({ success: true, msg: 'Login Signup Running...' });
});

app.post('/auth/login', [auth.login]);



app.use(jwt.authenticateToken);



app.post('/auth/logout', [auth.logout]);
app.post('/auth/logout_all', [auth.logout_all]);
app.get('/user/getUserDetails', [user.getUserDetails]);

//The 404 Route (ALWAYS Keep this as the last route)
app.get('*', function(req, res) {
    res.status(404).send({ success: false, msg: 'Wrong end point...' });
});

app.post('*', function(req, res) {
    res.status(404).send({ success: false, msg: 'Wrong end point...' });
});