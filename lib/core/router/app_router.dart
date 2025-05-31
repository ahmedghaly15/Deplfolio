import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/view/home_view.dart';
import '../../features/login/presentation/view/login_view.dart';
import '../utils/app_strings.dart';
import '../utils/functions/check_if_user_is_logged_in.dart';
import 'routes.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return isUserLoggedIn ? _homeRoute() : _loginRoute();
      case Routes.login:
        return _loginRoute();
      case Routes.home:
        return _homeRoute();
      default:
        return _unFoundRoute();
    }
  }

  static MaterialPageRoute<dynamic> _homeRoute() {
    return MaterialPageRoute(builder: (_) => const HomeView());
  }

  static MaterialPageRoute<dynamic> _loginRoute() =>
      MaterialPageRoute(builder: (_) => const LoginView());

  static Route<dynamic> _unFoundRoute() {
    return MaterialPageRoute(
      builder:
          (context) => Scaffold(
            body: Center(
              child: Text(
                AppStrings.unFoundRoute,
                style: context.shadTextTheme.h3,
              ),
            ),
          ),
    );
  }
}
