import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../features/portfolio/data/data_source/local_data_source/project_entity.dart';
import '../enums/experience_status.dart';
import '../models/project.dart';
import '../theming/color_manager.dart';
import '../utils/assets.dart';
import '../widgets/adaptive_circular_progress_indicator.dart';

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

  void popTop() => Navigator.of(this, rootNavigator: true).pop();
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
    Widget? titleWidget,
    Widget? child,
    String? titleText,
    String? descriptionText,
    List<Widget> actions = const [],
    bool isLoading = false,
    BoxConstraints? constraints,
  }) async {
    return await showShadDialog<T?>(
      context: this,
      barrierDismissible: !isLoading,
      builder:
          (_) => ShadDialog.alert(
            constraints: constraints,
            scrollPadding: EdgeInsets.symmetric(horizontal: 24.w),
            radius: BorderRadius.circular(16.r),
            removeBorderRadiusWhenTiny: false,
            gap: 24.h,
            expandActionsWhenTiny: false,
            actionsAxis: Axis.horizontal,
            actionsMainAxisAlignment: MainAxisAlignment.end,
            actionsMainAxisSize: MainAxisSize.min,
            actionsGap: 16.w,
            title: titleWidget ?? (titleText != null ? Text(titleText) : null),
            description: descriptionText != null ? Text(descriptionText) : null,
            actions: actions,
            child:
                isLoading
                    ? SizedBox(
                      height: 16.h,
                      child: const AdaptiveCircularProgressIndicator(
                        dimension: 16,
                        color: ColorManager.primaryColor,
                      ),
                    )
                    : child,
          ),
    );
  }
}

extension ProjectEntityMapper on ProjectEntity {
  Project toProjectModel(ProjectEntity entity) {
    return Project(
      id: entity.id,
      imgPath: entity.imgPath,
      title: entity.title,
      description: entity.description,
      shownInAbout: entity.shownInAbout,
      downloadLink: entity.downloadLink,
      promoLink: entity.promoLink,
      gitHubLink: entity.gitHubLink,
    );
  }
}

extension ProjectEntityListMapping on List<ProjectEntity>? {
  List<Project>? toProjectModelList() {
    if (this == null) {
      return null;
    } else if (this!.isEmpty) {
      return [];
    }
    return this!.map((entity) => entity.toProjectModel(entity)).toList();
  }
}

extension ProjectModelMapper on Project {
  ProjectEntity toProjectEntity() {
    return ProjectEntity(
      id: id,
      imgPath: imgPath,
      title: title,
      description: description,
      shownInAbout: shownInAbout,
      downloadLink: downloadLink,
      promoLink: promoLink,
      gitHubLink: gitHubLink,
    );
  }
}

extension ProjectModelListMapping on List<Project> {
  List<ProjectEntity> toProjectEntityList() {
    if (isEmpty) {
      return [];
    }
    return map((model) => model.toProjectEntity()).toList();
  }
}
