import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/text_styles_manager.dart';

extension UnfocusKeyboard on BuildContext {
  void unfocusKeyboard() => FocusScope.of(this).unfocus();
}

extension StringExtension on String? {
  bool get isNullOrEmpty => this == null || this == '';
}

extension ShowMyToast on BuildContext {
  void showToast(String message) => ScaffoldMessenger.of(this).showSnackBar(
    SnackBar(
      backgroundColor: Colors.black54,
      elevation: 0,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.startToEnd,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      content: Text(
        message,
        style: TextStylesManager.font12Regular.copyWith(color: Colors.white),
      ),
    ),
  );
}
