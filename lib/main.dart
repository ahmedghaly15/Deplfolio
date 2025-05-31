import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/utils/const_strings.dart';
import 'core/utils/functions/check_if_user_is_logged_in.dart';
import 'deplfolio_app.dart';
import 'riverpod_observer.dart';

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
  await dotenv.load();
  await Supabase.initialize(
    url: dotenv.env[ConstStrings.supabaseUrlKey]!,
    anonKey: dotenv.env[ConstStrings.supabaseAnonKey]!,
  );
  runApp(
    ProviderScope(observers: [RiverpodObserver()], child: const DeplfolioApp()),
  );
}
