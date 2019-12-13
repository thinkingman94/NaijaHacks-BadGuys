const mongoose = require('mongoose');

(async () => {
    try {
        await mongoose.connect('mongodb+srv://zenith:YmT1NGLOqbWsu7fJ@cluster0-qndoj.mongodb.net/test?retryWrites=true&w=majority', {
            useNewUrlParser: true,
            useUnifiedTopology: true
        });

        console.log('Successfully connected to mongodb')
    } catch (error) {
        console.error(error);

        mongoose = null;
    }
})();

module.exports = mongoose;