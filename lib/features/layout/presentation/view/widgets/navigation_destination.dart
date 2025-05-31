import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/color_manager.dart';

class AnimatedNavigationDestination extends StatelessWidget {
  final IconData? icon;
  final String label;
  final Widget? iconWidget;

  const AnimatedNavigationDestination({
    super.key,
    this.icon,
    required this.label,
    this.iconWidget,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: iconWidget ?? Icon(icon!, size: 24.h),
      selectedIcon:
          icon == null
              ? null
              : CircleAvatar(
                backgroundColor: ColorManager.primaryColor,
                radius: 24.h,
                child: Icon(icon!, color: Colors.white, size: 24.h),
              ),
      label: label,
    );
  }
}
