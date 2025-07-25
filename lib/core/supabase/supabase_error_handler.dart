import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/app_strings.dart';
import 'supabase_platform_error_code.dart';
import 'supabase_platform_error_message.dart';
import 'supabase_error_code.dart';
import 'supabase_error_message.dart';
import 'supabase_error.dart';

class SupabaseErrorHandler {
  SupabaseErrorHandler._();

  static SupabaseError handleError(dynamic error) {
    switch (error) {
      case AuthException _:
        return _handleAuthErrorFromCode(error.code);
      case PlatformException _:
        return _handlePlatformErrorFromCode(error.code);
      case StorageException _:
        return SupabaseError(message: error.message, code: error.statusCode);
      default:
        return const SupabaseError(message: AppStrings.defaultError);
    }
  }

  static SupabaseError _handlePlatformErrorFromCode(String? code) {
    switch (code) {
      case SupabasePlatformErrorCode.signInFailed:
        return SupabaseError(
          message: SupabasePlatformErrorMessage.signInFailed,
          code: code,
        );

      default:
        return SupabaseError(message: AppStrings.defaultError, code: code);
    }
  }

  static SupabaseError _handleAuthErrorFromCode(String? code) {
    switch (code) {
      case SupabaseErrorCode.notAdmin:
        return SupabaseError(
          message: SupabaseErrorMessage.notAdmin,
          code: code,
        );
      case SupabaseErrorCode.emailAddressInvalid:
        return SupabaseError(
          message: SupabaseErrorMessage.emailAddressInvalid,
          code: code,
        );
      case SupabaseErrorCode.emailAddressNotAuthorized:
        return SupabaseError(
          message: SupabaseErrorMessage.emailAddressNotAuthorized,
          code: code,
        );
      case SupabaseErrorCode.emailExists:
        return SupabaseError(
          message: SupabaseErrorMessage.emailExists,
          code: code,
        );
      case SupabaseErrorCode.emailNotConfirmed:
        return SupabaseError(
          message: SupabaseErrorMessage.emailNotConfirmed,
          code: code,
        );
      case SupabaseErrorCode.invalidCredentials:
        return SupabaseError(
          message: SupabaseErrorMessage.invalidCredentials,
          code: code,
        );
      case SupabaseErrorCode.oAuthNotSupported:
        return SupabaseError(
          message: SupabaseErrorMessage.oAuthNotSupported,
          code: code,
        );
      case SupabaseErrorCode.otpExpired:
        return SupabaseError(
          message: SupabaseErrorMessage.otpExpired,
          code: code,
        );
      case SupabaseErrorCode.overEmailSendRateLimit:
        return SupabaseError(
          message: SupabaseErrorMessage.overEmailSendRateLimit,
          code: code,
        );
      case SupabaseErrorCode.overRequestRateLimit:
        return SupabaseError(
          message: SupabaseErrorMessage.overRequestRateLimit,
          code: code,
        );
      case SupabaseErrorCode.overSmsSendRateLimit:
        return SupabaseError(
          message: SupabaseErrorMessage.overSmsSendRateLimit,
          code: code,
        );
      case SupabaseErrorCode.phoneExists:
        return SupabaseError(
          message: SupabaseErrorMessage.phoneExists,
          code: code,
        );
      case SupabaseErrorCode.phoneNotConfirmed:
        return SupabaseError(
          message: SupabaseErrorMessage.phoneNotConfirmed,
          code: code,
        );
      case SupabaseErrorCode.reauthenticationNeeded:
        return SupabaseError(
          message: SupabaseErrorMessage.reauthenticationNeeded,
          code: code,
        );
      case SupabaseErrorCode.reauthenticationNotValid:
        return SupabaseError(
          message: SupabaseErrorMessage.reauthenticationNotValid,
          code: code,
        );
      case SupabaseErrorCode.refreshTokenNotFound:
        return SupabaseError(
          message: SupabaseErrorMessage.refreshTokenNotFound,
          code: code,
        );
      case SupabaseErrorCode.requestTimeout:
        return SupabaseError(
          message: SupabaseErrorMessage.requestTimeout,
          code: code,
        );
      case SupabaseErrorCode.sessionExpired:
        return SupabaseError(
          message: SupabaseErrorMessage.sessionExpired,
          code: code,
        );
      case SupabaseErrorCode.smsSendFailed:
        return SupabaseError(
          message: SupabaseErrorMessage.smsSendFailed,
          code: code,
        );
      case SupabaseErrorCode.userAlreadyExists:
        return SupabaseError(
          message: SupabaseErrorMessage.userAlreadyExists,
          code: code,
        );
      case SupabaseErrorCode.userNotFound:
        return SupabaseError(
          message: SupabaseErrorMessage.userNotFound,
          code: code,
        );
      case SupabaseErrorCode.weakPassword:
        return SupabaseError(
          message: SupabaseErrorMessage.weakPassword,
          code: code,
        );
      case SupabaseErrorCode.validationFailed:
        return SupabaseError(
          message: SupabaseErrorMessage.validationFailed,
          code: code,
        );
      default:
        return SupabaseError(message: AppStrings.defaultError, code: code);
    }
  }
}
