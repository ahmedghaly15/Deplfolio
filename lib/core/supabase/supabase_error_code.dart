class SupabaseErrorCode {
  SupabaseErrorCode._();

  static const String emailAddressInvalid = 'email_address_invalid';
  static const String emailAddressNotAuthorized =
      'email_address_not_authorized';
  static const String emailExists = 'email_exists';
  static const String emailNotConfirmed = 'email_not_confirmed';
  static const String invalidCredentials = 'invalid_credentials';
  static const String oAuthNotSupported = 'oauth_provider_not_supported';
  static const String otpExpired = 'otp_expired';
  static const String overEmailSendRateLimit = 'over_email_send_rate_limit';
  static const String overRequestRateLimit = 'over_request_rate_limit';
  static const String overSmsSendRateLimit = 'over_sms_send_rate_limit';
  static const String phoneExists = 'phone_exists';
  static const String phoneNotConfirmed = 'phone_not_confirmed';
  static const String reauthenticationNeeded = 'reauthentication_needed';
  static const String reauthenticationNotValid = 'reauthentication_not_valid';
  static const String refreshTokenNotFound = 'refresh_token_not_found';
  static const String requestTimeout = 'request_timeout';
  static const String sessionExpired = 'session_expired';
  static const String smsSendFailed = 'sms_send_failed';
  static const String userAlreadyExists = 'user_already_exists';
  static const String userNotFound = 'user_not_found';
  static const String weakPassword = 'weak_password';
  static const String notAdmin = 'not_admin';
}
