import 'package:animate_do/animate_do.dart' show ElasticIn;
import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;

import '../router/routes.dart';
import '../utils/app_strings.dart';
import '../utils/assets.dart';
import 'primary_button.dart';

class FlutterErrorDetailsView extends StatelessWidget {
  const FlutterErrorDetailsView({super.key, required this.details});

  final FlutterErrorDetails details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          spacing: 16.h,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Lottie.asset(Assets.lottieShyLottie, fit: BoxFit.cover),
            ),
            ElasticIn(
              child: Text(
                AppStrings.defaultError,
                style: context.shadTextTheme.h4,
                textAlign: TextAlign.center,
              ),
            ),
            ElasticIn(
              child: Text(
                AppStrings.dontWorry,
                style: context.shadTextTheme.p,
                textAlign: TextAlign.center,
              ),
            ),
            ElasticIn(
              child: PrimaryButton(
                onPressed: () => context.pushReplacementNamed(Routes.layout),
                leading: const Icon(LucideIcons.house),
                text: AppStrings.goToHome,
              ),
            ),
            ElasticIn(
              child: PrimaryButton(
                onPressed:
                    () => context.showDialog(
                      titleText: AppStrings.errorDetails,
                      child: Text(details.toString()),
                    ),
                leading: const Icon(LucideIcons.bug),
                text: AppStrings.showErrorDetails,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
