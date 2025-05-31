import 'package:deplfolio/core/utils/const_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show ScreenUtilInit;
import 'package:shadcn_ui/shadcn_ui.dart';

import 'core/router/app_router.dart';
import 'core/theming/theme_manager.dart';

class DeplfolioApp extends StatelessWidget {
  const DeplfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (_, __) => ShadApp.custom(
            themeMode: ThemeMode.dark,
            theme: ThemeManager.darkTheme,
            appBuilder:
                (context) => MaterialApp(
                  theme: ThemeManager.materialTheme(context),
                  title: ConstStrings.appTitle,
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: AppRouter.onGenerateRoute,
                  builder: (_, child) => ShadAppBuilder(child: child),
                ),
          ),
    );
  }
}
