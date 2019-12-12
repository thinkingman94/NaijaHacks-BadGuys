const express = require('express');
const bodyParser = require('body-parser');
const User = require('./routes/user');

const app = express();

app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Headers',
        'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization');
    res.setHeader('Access-Control-Allow-Methods',
        'GET, POST, PUT, DELETE, PATCH, OPTIONS');
    next();
});

app.use(bodyParser.json());

app.get('/users', User.getAllUsers);

app.get('/users/:id', User.getUser);

app.post('/users', User.createUser);

app.put('/users/:id', User.updateUser);

app.delete('/users/:id', User.deleteUser);

module.exports = app;