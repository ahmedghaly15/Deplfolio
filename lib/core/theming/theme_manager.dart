import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../utils/const_strings.dart';
import 'color_manager.dart';
import 'text_styles_manager.dart';

class ThemeManager {
  ThemeManager._();

  static ShadThemeData get darkTheme => ShadThemeData(
    colorScheme: const ShadSlateColorScheme.dark(
      background: ColorManager.darkModeColor,
      primary: ColorManager.primaryColor,
    ),
    brightness: Brightness.dark,
    primaryButtonTheme: ShadButtonTheme(
      size: ShadButtonSize.lg,
      pressedBackgroundColor: ColorManager.primaryColor.withAlpha(102),
      decoration: ShadDecoration(
        border: ShadBorder(radius: BorderRadius.circular(16.r)),
      ),
      gradient: const LinearGradient(
        colors: [ColorManager.primaryColor, ColorManager.colorC65647],
        stops: [0.0, 1.0],
        begin: AlignmentDirectional.centerEnd,
        end: AlignmentDirectional.centerStart,
      ),
      shadows: [
        BoxShadow(
          color: ColorManager.primaryColor.withAlpha(102),
          spreadRadius: 4,
          blurRadius: 10,
          offset: Offset(0, 2.w),
        ),
      ],
    ),
    textTheme: ShadTextTheme(family: ConstStrings.fontFamily),
    inputTheme: ShadInputTheme(
      inputPadding: _inputPadding,
      style: _textFieldTextStyle,
      placeholderStyle: _textFieldTextStyle.copyWith(
        color: ColorManager.colorA4A4A4,
      ),
      decoration: ShadDecoration(
        errorStyle: TextStyle(fontSize: 13.sp, color: Colors.red),
        focusedBorder: _textFieldUnderlineInputBorder(
          borderColor: ColorManager.primaryColor,
          width: 2,
        ),
        errorBorder: _textFieldUnderlineInputBorder(
          borderColor: Colors.red,
          width: 1.3,
        ),
        border: _textFieldUnderlineInputBorder(),
        disableSecondaryBorder: true,
      ),
    ),
  );

  static ThemeData materialTheme(BuildContext context) =>
      Theme.of(context).copyWith(
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: context.shadTheme.colorScheme.background,
          indicatorColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(color: Colors.white, size: 24.h);
            }
            return IconThemeData(color: ColorManager.primaryColor, size: 24.h);
          }),
        ),
      );

  static EdgeInsets get _inputPadding =>
      EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h);

  static TextStyle get _textFieldTextStyle => TextStylesManager.font12Regular;

  static ShadBorder _textFieldUnderlineInputBorder({
    Color? borderColor,
    double width = 1,
  }) {
    return ShadBorder(
      radius: BorderRadius.circular(16.r),
      top: _inputBorderSide(borderColor, width),
      bottom: _inputBorderSide(borderColor, width),
      left: _inputBorderSide(borderColor, width),
      right: _inputBorderSide(borderColor, width),
    );
  }

  static ShadBorderSide _inputBorderSide(Color? borderColor, double width) {
    return ShadBorderSide(
      color: borderColor ?? ColorManager.colorA4A4A4,
      width: width.w,
    );
  }
}
