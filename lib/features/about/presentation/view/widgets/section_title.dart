import 'package:flutter/material.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/theming/color_manager.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.shadTextTheme.h4.copyWith(
        color: ColorManager.primaryColor,
      ),
    );
  }
}
