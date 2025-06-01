import 'package:flutter/material.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../theming/color_manager.dart';

class AdaptiveRefreshIndicator extends StatelessWidget {
  const AdaptiveRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  final Widget child;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: onRefresh,
      color: ColorManager.primaryColor,
      backgroundColor: context.shadTheme.colorScheme.background,
      child: child,
    );
  }
}
