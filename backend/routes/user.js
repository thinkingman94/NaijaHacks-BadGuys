const User = require('./models/user');

exports.createUser = (req, res, next) => {
    const user = new User({
        subscription: req.body.subscription,
        first_name: req.body.first_name,
        last_name: req.body.last_name,
        dob: req.body.dob,
        email: req.body.email,
        phone: req.body.phone,
        home: req.body.home,
        office: req.body.office,
        others: req.body.others,
        last_login: req.body.last_login,
        password: req.body.password,
        number_of_logins: req.body.number_of_logins,
        date_time: req.body.date_time,
        ip_address: req.body.ip_address,
        screen_height: req.body.screen_height,
        screen_width: req.body.screen_width
    });
    user.save().then(
        () => res.status(201).json({
            message: 'User saved successfully!'
        })
    ).catch(
        error => res.status(400).json({
            error: error
        })
    );
};

exports.updateUser = (req, res, next) => {
    const user = new User({
        _id: req.params.id,
        subscription: req.body.subscription,
        first_name: req.body.first_name,
        last_name: req.body.last_name,
        dob: req.body.dob,
        email: req.body.email,
        phone: req.body.phone,
        home: req.body.home,
        office: req.body.office,
        others: req.body.others,
        last_login: req.body.last_login,
        password: req.body.password,
        number_of_logins: req.body.number_of_logins,
        date_time: req.body.date_time,
        ip_address: req.body.ip_address,
        screen_height: req.body.screen_height,
        screen_width: req.body.screen_width
    });
    User.updateOne({
            _id: req.params.id
        }, user)
        .then(
            () => res.status(201).json({
                message: 'User updated successfully!'
            })
        )
        .catch(
            error => res.status(400).json({
                error: error
            })
        );
};

exports.deleteUser = (req, res, next) => {
    User.deleteOne({
        _id: req.params.id
    }).then(
        () => res.status(200).json({
            message: 'User deleted!'
        })
    ).catch(
        error => res.status(400).json({
            error: error
        })
    )
};

exports.getAllUsers = (req, res, next) => {
    User.find().then(
        users => res.status(200).json(users)
    ).catch(
        error => res.status(400).json({
            error: error
        })
    )
};

exports.getUser = (req, res, next) => {
    User.findOne({
        _id: req.params.id
    }).then(
        users => res.status(200).json(users)
    )
    .catch(
        error => res.status(404).json({
            error: error
        })
    )
};