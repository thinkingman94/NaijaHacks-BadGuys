module.exports = () => {
    const charset = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
    const charsetLength = charset.length - 1;

    let otp = '';

    for (let i = 0; i < 4; i += 1) {
        otp += charset[Math.floor(Math.random() * (charsetLength - 0 + 1)) + 0];
    }

    return otp;
};