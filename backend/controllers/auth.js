const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const User = require('../models/user');
const PhoneValidation = require('../models/phoneValidation');
const generateOtp = require('../helpers/generate_otp');
const sendSms = require('../helpers/sendSms');
const normalisePhoneNumber = require('../helpers/normalisePhoneNumber');
const ObjectId = require('mongoose').Types.ObjectId;

const checkOtp = (id, otp) => {
    return new Promise((resolve, reject) => {
        PhoneValidation.findOne({
            _id: id
        }).then(
            (user) => {
                if (!user || user.otp === otp) {
                    return reject({
                        error: new Error('Otp not found!')
                    });
                }

                if ((Date.now() - req.body.date_time) / 1000 > 9e2) {
                    return reject({
                        error: new Error('Otp expired!')
                    });
                }

                resolve(user.subject);
            }
        ).catch(
            (error) => {
                return reject({
                    error: error
                });
            }
        );
    });
}

exports.otp_init = (req, res, next) => {
    const phone = normalisePhoneNumber(req.body.subject);
    const otp = generateOtp();
    const phoneValidation = new PhoneValidation({
        subject: phone,
        otp: otp,
        date_time: Date.now()
    });

    phoneValidation.save().then(
        () => {
            sendSms(phone, `Your TrackAm otp code: ${otp}. Valid for 15 miuntes. Safe trip just got safer!`)
            .then(() => {
                res.status(200).json({
                    message: 'Phone validation token added successfully!',
                    id: phoneValidation._id
                });
            }).catch((error) => {
                res.status(500).json({
                    error: error
                });
            });
        }
    ).catch(
        (error) => {
            res.status(500).json({
                error: error
            });
        }
    );
};

exports.signup = (req, res, next) => {
    if(req.body.id && req.body.otp){
        if(new ObjectId(req.body.id) === req.body.id){
        checkOtp(req.body.id, req.body.otp)
        .then((subject) => {
            bcrypt.hash(req.body.password, 10).then(
                (hash) => {
                    const user = new User({
                        subscription: req.body.subscription,
                        first_name: req.body.first_name,
                        last_name: req.body.last_name,
                        dob: req.body.dob,
                        email: req.body.email,
                        phone: subject,
                        number_of_logins: 0,
                        date_time: Date.now(),
                        ip_address: req.body.ip_address,
                        screen_height: req.body.screen_height,
                        screen_width: req.body.screen_width,
                        password: hash
                    });

                    user.save().then(
                        () => {
                            res.status(201).json({
                                message: 'User added successfully!'
                            });
                        }
                    ).catch(
                        (error) => {
                            res.status(500).json({
                                error: error
                            });
                        }
                    );
                }
            );
        }).catch((error) => {
            res.status(500).json({
                error: error
            });
        });
    }else{
        res.status(400).json({
            error: 'The id invalid'
        });
    }
    }else{
        res.status(400).json({
            error: 'The id and otp are required'
        });
    }
};

exports.login = (req, res, next) => {
    User.findOne({
        email: req.body.phone
    }).then(
        (user) => {
            if (!user) {
                return res.status(401).json({
                    error: new Error('User not found!')
                });
            }
            bcrypt.compare(req.body.password, user.password).then(
                (valid) => {
                    if (!valid) {
                        return res.status(401).json({
                            error: new Error('Incorrect password!')
                        });
                    }
                    const token = jwt.sign({
                            userId: user._id
                        },
                        'RANDOM_TOKEN_SECRET', {
                            expiresIn: '24h'
                        });
                    res.status(200).json({
                        userId: user._id,
                        token: token
                    });
                }
            ).catch(
                (error) => {
                    res.status(500).json({
                        error: error
                    });
                }
            );
        }
    ).catch(
        (error) => {
            res.status(500).json({
                error: error
            });
        }
    );
}