import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../utils/app_strings.dart';
import '../widgets/primary_button.dart';

extension UnfocusKeyboard on BuildContext {
  void unfocusKeyboard() => FocusScope.of(this).unfocus();
}

extension StringExtension on String? {
  bool get isNullOrEmpty => this == null || this == '';
}

extension ShowMyToast on BuildContext {
  void showToast(String message) => ShadToaster.of(this).show(
    ShadToast.destructive(
      backgroundColor: Colors.black54,
      duration: const Duration(seconds: 2),
      radius: BorderRadius.circular(16.r),
      description: Text(message),
    ),
  );
}

extension AppNavigator on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String newRoute, {Object? arguments}) {
    return Navigator.pushReplacementNamed(this, newRoute, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String newRoute, {
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil(
      this,
      newRoute,
      (Route<dynamic> route) => false, // remove all previous routes
      arguments: arguments,
    );
  }

  void pop() => Navigator.pop(this);
}

extension ShadThemeAccess on BuildContext {
  ShadThemeData get shadTheme => ShadTheme.of(this);
  ShadTextTheme get shadTextTheme => shadTheme.textTheme;
}

extension ShowDialog<T> on BuildContext {
  Future<T?> showDialog({
    Widget? title,
    description,
    child,
    List<Widget>? actions,
  }) async {
    return showShadDialog<T?>(
      context: this,
      builder:
          (context) => Container(
            margin: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
              top: 56.h,
              bottom: 24.h,
            ),
            child: ShadDialog(
              radius: BorderRadius.all(Radius.circular(16.r)),
              title: title,
              description: description,
              child: child,
              actions:
                  actions ??
                  [PrimaryButton(onPressed: () => pop(), text: AppStrings.ok)],
            ),
          ),
    );
  }
}
