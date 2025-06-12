import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../enums/experience_status.dart';
import '../utils/assets.dart';

extension UnfocusKeyboard on BuildContext {
  void unfocusKeyboard() => FocusScope.of(this).unfocus();
}

extension StringExtension on String? {
  bool get isNullOrEmpty => this?.isEmpty ?? true;
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
    Widget? description,
    Widget? child,
    String? titleText,
    List<Widget>? actions,
    EdgeInsets? scrollPadding,
    double gap = 24.0,
    double radius = 16.0,
  }) async {
    return showShadDialog<T?>(
      context: this,
      builder:
          (_) => ShadDialog(
            gap: gap.h,
            scrollPadding:
                scrollPadding ?? EdgeInsets.symmetric(horizontal: 24.w),
            radius: BorderRadius.circular(radius.r),
            removeBorderRadiusWhenTiny: false,
            title: title ?? (titleText != null ? Text(titleText) : null),
            description: description,
            actions: actions ?? [const SizedBox.shrink()],
            child: child,
          ),
    );
  }
}

extension WorkExperienceAssetImgPath on ExperienceStatus {
  String get getImgPath => switch (this) {
    ExperienceStatus.freelance => Assets.imagesFreelanceIcon,
    ExperienceStatus.fullTime => Assets.imagesJobIcon,
    ExperienceStatus.partTime => Assets.imagesJobIcon,
    ExperienceStatus.remote ||
    ExperienceStatus.internship => Assets.imagesInternExperienceImg,
  };
}

extension WorkExperienceName on ExperienceStatus {
  String get getName => switch (this) {
    ExperienceStatus.freelance => 'Freelance',
    ExperienceStatus.fullTime => 'Full-time',
    ExperienceStatus.partTime => 'Part-time',
    ExperienceStatus.remote => 'Remote',
    ExperienceStatus.internship => 'Internship',
  };
}

extension RequestFocusOnFocusNode on BuildContext {
  void requestFocus(FocusNode node) => FocusScope.of(this).requestFocus(node);
}

extension ShowAlertDialog<T> on BuildContext {
  Future<T?> showAlertDialog({
    required String titleText,
    required String descriptionText,
    required List<Widget> actions,
  }) async {
    return await showShadDialog<T?>(
      context: this,
      builder:
          (_) => ShadDialog.alert(
            scrollPadding: EdgeInsets.symmetric(horizontal: 24.w),
            radius: BorderRadius.circular(16.r),
            removeBorderRadiusWhenTiny: false,
            gap: 24.h,
            expandActionsWhenTiny: false,
            actionsAxis: Axis.horizontal,
            actionsMainAxisAlignment: MainAxisAlignment.end,
            actionsMainAxisSize: MainAxisSize.min,
            actionsGap: 16.w,
            title: Text(titleText),
            description: Text(descriptionText),
            actions: actions,
          ),
    );
  }
}
