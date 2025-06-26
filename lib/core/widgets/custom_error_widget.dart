import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_strings.dart';
import '../utils/assets.dart';
import 'primary_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.error, this.onRetry});

  final String error;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 32.h,
        children: [
          Flexible(
            child: Lottie.asset(Assets.lottieShyLottie, fit: BoxFit.cover),
          ),
          Text(
            error,
            style: context.shadTextTheme.p,
            textAlign: TextAlign.center,
          ),
          PrimaryButton(onPressed: onRetry, text: AppStrings.retry),
        ],
      ),
    );
  }
}
