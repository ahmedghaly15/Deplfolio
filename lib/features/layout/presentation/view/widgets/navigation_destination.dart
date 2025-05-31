import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

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
              : ElasticIn(
                duration: const Duration(milliseconds: 500),
                child: Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: context.shadTheme.primaryButtonTheme.gradient,
                    boxShadow: context.shadTheme.primaryButtonTheme.shadows,
                  ),
                  child: Icon(icon!),
                ),
              ),
      label: label,
    );
  }
}
