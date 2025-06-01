import 'package:deplfolio/core/helpers/extensions.dart';

import '../../helpers/cache_helper.dart';
import '../app_utils.dart';
import '../cache_keys.dart';

bool isUserLoggedIn = false;

Future<void> checkIfUserIsLoggedIn() async {
  final cachedUserId = await CacheHelper.getSecuredString(CacheKeys.userId);
  if (cachedUserId.isNullOrEmpty) {
    isUserLoggedIn = false;
  } else {
    AppUtils.userId = cachedUserId;
    isUserLoggedIn = true;
  }
}
