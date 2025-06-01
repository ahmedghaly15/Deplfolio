import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppUtils {
  AppUtils._();

  static String? userId;
  static EdgeInsetsGeometry screenPadding = EdgeInsets.symmetric(
    vertical: 40.h,
    horizontal: 16.w,
  );
  static BorderRadius cardRadius = BorderRadius.circular(16.r);
}
