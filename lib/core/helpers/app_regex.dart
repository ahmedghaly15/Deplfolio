class AppRegex {
  AppRegex._();

  static bool isEmailValid(String email) {
    return RegExp(
      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
    ).hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
    ).hasMatch(password);
  }

  static bool isEgPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^\+20(10|11|12|15)[0-9]{8,9}$').hasMatch(phoneNumber);
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }

  static bool isValidUrl(String url) {
    const pattern =
        r'^(https?:\/\/)?' // optional http or https
        r'(([a-zA-Z0-9_-]+\.)+[a-zA-Z]{2,})' // domain
        r'(:\d+)?' // optional port
        r'(\/\S*)?$'; // optional path
    return RegExp(pattern).hasMatch(url);
  }
}
