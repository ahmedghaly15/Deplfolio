import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/utils/const_strings.dart';
import 'core/utils/functions/check_if_user_is_logged_in.dart';
import 'core/widgets/flutter_error_details_view.dart';
import 'deplfolio_app.dart';
import 'riverpod_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    ScreenUtil.ensureScreenSize(),
    checkIfUserIsLoggedIn(),
    dotenv.load(),
  ]);

  await Supabase.initialize(
    url: dotenv.env[ConstStrings.supabaseUrlKey]!,
    anonKey: dotenv.env[ConstStrings.supabaseAnonKey]!,
  );

  ErrorWidget.builder =
      (FlutterErrorDetails details) =>
          FlutterErrorDetailsView(details: details);

  runApp(
    ProviderScope(observers: [RiverpodObserver()], child: const DeplfolioApp()),
  );
}
