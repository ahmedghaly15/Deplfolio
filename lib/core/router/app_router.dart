import 'package:deplfolio/features/login/presentation/view/login_view.dart';
import 'package:flutter/material.dart';

import '../theming/app_text_styles.dart';
import '../utils/app_strings.dart';
import 'routes.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginView());
      default:
        return _unFoundRoute();
    }
  }

  static Route<dynamic> _unFoundRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            body: Center(
              child: Text(
                AppStrings.unFoundRoute,
                style: AppTextStyles.font24Medium,
              ),
            ),
          ),
    );
  }
}
