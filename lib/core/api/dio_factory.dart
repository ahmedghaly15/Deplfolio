import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/const_strings.dart';
import 'dio_logger_interceptor.dart';

final dioProvider = Provider<Dio>((ref) => DioFactory.getDio());

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? _dio;

  static Dio getDio() {
    const Duration timeOut = Duration(seconds: 30);
    if (_dio == null) {
      _dio = Dio();
      _dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.headers = {
          'Authorization': 'token ${dotenv.env[ConstStrings.githubToken]!}',
          'Accept': 'application/vnd.github+json',
        };
      _addDioLoggerInterceptor();
      return _dio!;
    } else {
      return _dio!;
    }
  }

  static void _addDioLoggerInterceptor() {
    _dio?.interceptors.add(DioLoggerInterceptor());
  }
}
