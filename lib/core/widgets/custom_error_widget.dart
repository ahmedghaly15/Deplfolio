import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../theming/color_manager.dart';
import '../utils/app_strings.dart';
import 'primary_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.error, this.onPressed});

  final String error;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 32.h,
        children: [
          Icon(Icons.error, size: 64.h, color: ColorManager.primaryColor),
          Text(
            error,
            style: context.shadTextTheme.p,
            textAlign: TextAlign.center,
          ),
          if (onPressed != null)
            PrimaryButton(onPressed: onPressed, text: AppStrings.retry),
        ],
      ),
    );
  }
}
