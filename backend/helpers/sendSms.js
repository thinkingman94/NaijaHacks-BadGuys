const Nexmo = require('nexmo');

const nexmo = new Nexmo({
  apiKey: 'b7c7393b',
  apiSecret: 'pn5eLzrJp1uAACth',
});

module.exports = (to, text, from = 'TrackAm') => {
    return new Promise((resolve, reject) => {
        nexmo.message.sendSms(from, to, text, {
            type: "unicode"
          }, (err, responseData) => {
            if (err) {
                reject({error: err});
            } else {
              if (responseData.messages[0]['status'] === "0") {
                resolve({message: "Message sent successfully."});
              } else {
                reject({error: `Message failed with error: ${responseData.messages[0]['error-text']}`});
              }
            }
          });
    })
};