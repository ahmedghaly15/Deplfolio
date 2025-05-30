import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../utils/const_strings.dart';
import 'color_manager.dart';

class ThemeManager {
  ThemeManager._();

  static ShadThemeData get darkTheme => ShadThemeData(
    colorScheme: const ShadSlateColorScheme.dark(
      primary: ColorManager.color9C3FE4,
    ),
    brightness: Brightness.dark,
    primaryButtonTheme: const ShadButtonTheme(
      gradient: LinearGradient(
        colors: [ColorManager.color9C3FE4, ColorManager.colorC65647],
        stops: [0.0, 1.0],
        begin: AlignmentDirectional.centerStart,
        end: AlignmentDirectional.centerStart,
      ),
    ),
    textTheme: ShadTextTheme(family: ConstStrings.fontFamily),
  );
}
