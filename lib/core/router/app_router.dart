import 'package:deplfolio/features/login/presentation/view/login_view.dart';
import 'package:flutter/material.dart';

import '../theming/text_styles_manager.dart';
import '../utils/app_strings.dart';
import 'routes.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _loginRoute();
      case Routes.login:
        return _loginRoute();
      default:
        return _unFoundRoute();
    }
  }

  static MaterialPageRoute<dynamic> _loginRoute() =>
      MaterialPageRoute(builder: (_) => const LoginView());

  static Route<dynamic> _unFoundRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            body: Center(
              child: Text(
                AppStrings.unFoundRoute,
                style: TextStylesManager.font18Medium,
              ),
            ),
          ),
    );
  }
}
