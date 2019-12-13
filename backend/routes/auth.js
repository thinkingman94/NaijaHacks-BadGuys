const express = require('express');
const router = express.Router();

const authCtrl = require('../controllers/auth');

router.post('/otp_init', authCtrl.otp_init);

router.post('/signup', authCtrl.signup);

router.post('/login', authCtrl.login);

module.exports = router;