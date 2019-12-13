module.exports = () => {
    const charset = [1234567890];
    const charsetLength = charset.length;

    let otp = '';

    for (let i = 0; i < 4; i += 1) {
        otp += charset[Math.floor(Math.random() * (charsetLength - 0 + 1)) + 0];
    }

    return otp;
};