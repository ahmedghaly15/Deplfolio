import 'app_regex.dart';

class InputValidator {
  InputValidator._();

  static String? validatingEmailField(String? value) {
    if (value == null || value.isEmpty) {
      return "Email can't be blank!";
    } else if (!AppRegex.isEmailValid(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? validatingPasswordField(String? value) {
    if (value == null || value.isEmpty) {
      return "Password can't be blank!";
    } else if (!AppRegex.isPasswordValid(value)) {
      return "Please enter a valid password";
    }
    return null;
  }

  static String? validateOptionalPassword(String? value) {
    if (value == null || value.isEmpty) {
      // User did not enter a password; considered valid (no update intended)
      return null;
    } else if (!AppRegex.isPasswordValid(value)) {
      return "Please enter a valid password";
    }
    return null;
  }

  static String? validateEgPhoneField(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone can't be blank!";
    } else if (!AppRegex.isEgPhoneNumberValid(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? validatingNameField(String? value) {
    if (value == null || value.isEmpty) {
      return "Name can't be blank!";
    } else if (value.length < 2) {
      return "Name must be at least 2 characters long";
    }
    return null;
  }

  static String? validatingConfirmPasswordField({
    String? password,
    String? confirmPassword,
  }) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm password can't be blank!";
    } else if (password != confirmPassword) {
      return "Passwords do not match";
    }
    return null;
  }

  static String? validatingEmptyField(String? value) {
    if (value == null || value.isEmpty) {
      return "This field can't be blank!";
    }
    return null;
  }

  static String? validatingUrlField(String? value) {
    if (value == null || value.isEmpty) {
      return "URL can't be blank!";
    } else if (!AppRegex.isValidUrl(value)) {
      return "Please enter a valid URL";
    }
    return null;
  }
}
