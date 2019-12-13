const express = require('express');
const router = express.Router();

const auth = require('../middleware/auth');

const userCtrl = require('../controllers/user');

router.get('/', auth, userCtrl.getAllUsers);

router.get('/:id', auth, userCtrl.getUser);

router.post('/', auth, userCtrl.createUser);

router.put('/:id', auth, userCtrl.updateUser);

router.delete('/users/:id', auth, userCtrl.deleteUser);

module.exports = router;