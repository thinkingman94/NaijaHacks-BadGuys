const mongoose = require('./mongooseConnect');

if(!mongoose){
  return;
}

const uniqueValidator = require('mongoose-unique-validator');

const userSchema = mongoose.Schema({
  // id: {
  //   type: String,
  //   required: true
  // },
  subscription: {
    type: String,
    required: false
  },
  first_name: {
    type: String,
    required: true
  },
  last_name: {
    type: String,
    required: false
  },
  dob: {
    type: Date,
    required: false
  },
  email: {
    type: String,
    required: false
  },
  phone: {
    type: String,
    required: true
  },
  home: {
    description: {
      type: String,
      required: false
    },
    coordinates: {
      type: [Number],
      index: '2dsphere'
    }
  },
  office: {
    description: {
      type: String,
      required: false
    },
    coordinates: {
      type: [Number],
      index: '2dsphere'
    }
  },
  others: [{
    description: {
      type: String,
      required: false
    },
    coordinates: {
      type: [Number],
      index: '2dsphere'
    }
  }],
  last_login: {
    type: Number,
    required: false
  },
  number_of_logins: {
    type: String,
    required: true
  },
  date_time: {
    type: Number,
    required: true
  },
  deleted: {
    type: Boolean,
    required: false
  },
  suspended: {
    type: Boolean,
    required: false
  },
  ip_address: {
    type: String,
    required: false
  },
  screen_height: {
    type: Number,
    required: false
  },
  screen_width: {
    type: Number,
    required: false
  }
});

userSchema.plugin(uniqueValidator);

module.exports = mongoose.model('User', userSchema);