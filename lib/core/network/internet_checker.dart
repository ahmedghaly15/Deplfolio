import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final _internetConnectionProvider = Provider.autoDispose<InternetConnection>(
  (ref) => InternetConnection(),
);

final internetCheckerProvider = Provider.autoDispose<InternetChecker>((ref) {
  final connectionChecker = ref.watch(_internetConnectionProvider);
  return InternetChecker(connectionChecker);
});

class InternetChecker {
  final InternetConnection _connectionChecker;

  InternetChecker(this._connectionChecker);

  Future<bool> get isConnected async =>
      await _connectionChecker.hasInternetAccess;
}
