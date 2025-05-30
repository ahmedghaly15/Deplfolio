import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/functions/check_if_user_is_logged_in.dart';
import 'deplfolio_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // To fix texts being hidden bug in release mode
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await checkIfUserIsLoggedIn();
  runApp(const ProviderScope(child: DeplfolioApp()));
}
