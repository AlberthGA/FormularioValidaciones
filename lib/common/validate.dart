validateRFC(String rfc) {
  String regex =
      r'^([A-Z]{3,4})(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01]))[A-Z\d]{2}(?:[A\d]))?$';
  return RegExp(regex).hasMatch(rfc);
}

validateEmail(String email) {
  String regex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  return RegExp(regex).hasMatch(email);
}

validateNumberPhone(String phone) {
  String regex = r'^\+(?:[0-9] ?){6,14}[0-9]$';
  return RegExp(regex).hasMatch(phone);
}

validateZipCode(String code) {
  String regex = r'^\d{5}(?:[-\s]\d{4})?$';
  return RegExp(regex).hasMatch(code);
}
