import 'package:deplfolio/core/utils/const_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show ScreenUtilInit;
import 'package:shadcn_ui/shadcn_ui.dart';

import 'core/router/app_router.dart';

class DeplfolioApp extends StatelessWidget {
  const DeplfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.custom(
      themeMode: ThemeMode.dark,
      appBuilder:
          (context) => ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder:
                (context, _) => MaterialApp(
                  theme: Theme.of(context),
                  title: ConstStrings.appTitle,
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: AppRouter.onGenerateRoute,
                  builder: (context, child) => ShadAppBuilder(child: child),
                ),
          ),
    );
  }
}
