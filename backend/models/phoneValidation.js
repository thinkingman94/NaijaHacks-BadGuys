const mongoose = require('./mongooseConnect');

if(!mongoose){
  return;
}

const userSchema = mongoose.Schema({
  subject: {
    type: String,
    required: true
  },
  otp: {
    type: String,
    required: true
  },
  date_time: {
    type: Number,
    required: true
  }
});

module.exports = mongoose.model('PhoneValidation', userSchema);