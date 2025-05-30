class SupabaseErrorMessage {
  SupabaseErrorMessage._();

  static const String emailAddressInvalid =
      'The email address format is invalid.';
  static const String emailAddressNotAuthorized =
      'This email address is not authorized.';
  static const String emailExists =
      'An account with this email already exists.';
  static const String emailNotConfirmed =
      'Please confirm your email address before continuing.';
  static const String invalidCredentials =
      'The email or password is incorrect.';
  static const String oAuthNotSupported =
      'This OAuth provider is not supported.';
  static const String otpExpired = 'The OTP code has expired.';
  static const String overEmailSendRateLimit =
      'Too many email requests. Please try again later.';
  static const String overRequestRateLimit =
      'Too many requests. Please try again in a moment.';
  static const String overSmsSendRateLimit =
      'SMS send limit exceeded. Try again later.';
  static const String phoneExists =
      'An account with this phone number already exists.';
  static const String phoneNotConfirmed = 'Your phone number is not confirmed.';
  static const String reauthenticationNeeded =
      'Reauthentication is required to proceed.';
  static const String reauthenticationNotValid =
      'Reauthentication failed. Please try again.';
  static const String refreshTokenNotFound =
      'Refresh token is missing or invalid.';
  static const String requestTimeout =
      'The request timed out. Please try again.';
  static const String sessionExpired =
      'Your session has expired. Please log in again.';
  static const String smsSendFailed = 'Failed to send SMS. Please try again.';
  static const String userAlreadyExists = 'This user already exists.';
  static const String userNotFound = 'User not found.';
  static const String weakPassword = 'The password is too weak.';
  static const String noAccessTokenFound = 'No Access Token found.';
  static const String noIdTokenFound = 'No ID Token found.';
  static const String notAdmin = 'You are not an admin.';
}
