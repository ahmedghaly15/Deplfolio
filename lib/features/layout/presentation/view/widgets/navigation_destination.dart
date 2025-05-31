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
      icon: iconWidget ?? Icon(icon!),
      selectedIcon:
          icon == null
              ? null
              : Container(
                padding: EdgeInsets.all(12.h),
                decoration: const BoxDecoration(
                  color: ColorManager.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon!),
              ),
      label: label,
    );
  }
}
