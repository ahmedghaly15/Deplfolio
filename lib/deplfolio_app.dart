import 'package:flutter/material.dart';

import 'core/router/app_router.dart';
import 'core/utils/app_strings.dart';

class DeplfolioApp extends StatelessWidget {
  const DeplfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
