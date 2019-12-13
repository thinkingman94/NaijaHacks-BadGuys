module.exports = (_phoneNumber) => {
    let phoneNumber;

    if(_phoneNumber.substring(0, 1) === '+'){
        phoneNumber = _phoneNumber.substring(1);
    } else if (_phoneNumber.length > 11) {
        phoneNumber = _phoneNumber;
    } else if(_phoneNumber.length === 11){
        phoneNumber = `234${_phoneNumber.substring(1)}`;
    }else {
        phoneNumber = _phoneNumber;
    }
    
    return phoneNumber;
};