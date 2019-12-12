const mongoose = require('mongoose');

mongoose.connect('mongodb+srv://zenith:YmT1NGLOqbWsu7fJ@cluster0-qndoj.mongodb.net/test?retryWrites=true&w=majority', {
    useNewUrlParser: true,
    useUnifiedTopology: true
  })
  .then(() => console.log('Successfully connected to mongodb'))
  .catch(error => console.error(error));

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
    required: true
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
      required: true
    },
    coordinates: {
      type: [Number],
      index: '2dsphere'
    }
  },
  office: {
    description: {
      type: String,
      required: true
    },
    coordinates: {
      type: [Number],
      index: '2dsphere'
    }
  },
  others: [{
    description: {
      type: String,
      required: true
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
  password: {
    type: String,
    required: true
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
    required: true
  },
  screen_height: {
    type: Number,
    required: true
  },
  screen_width: {
    type: Number,
    required: true
  }
});

module.exports = mongoose.model('User', userSchema);