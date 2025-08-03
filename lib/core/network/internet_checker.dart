import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final _internetConnectionProvider = Provider.autoDispose<InternetConnection>(
  (ref) => InternetConnection(),
);

final internetCheckerProvider = Provider.autoDispose<InternetChecker>((ref) {
  final connectionChecker = ref.read(_internetConnectionProvider);
  return InternetCheckerImpl(connectionChecker);
});

abstract class InternetChecker {
  Future<bool> get isConnected;
}

class InternetCheckerImpl implements InternetChecker {
  final InternetConnection _connectionChecker;

  InternetCheckerImpl(this._connectionChecker);

  @override
  Future<bool> get isConnected async =>
      await _connectionChecker.hasInternetAccess;
}
