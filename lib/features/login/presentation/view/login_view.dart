import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/text_styles_manager.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/primary_button.dart';
import 'widgets/login_form_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: FittedBox(
                child: Text(
                  AppStrings.welcomeBack,
                  style: TextStylesManager.font24SemiBold,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: FittedBox(
                child: Text(
                  AppStrings.welcomeBackWeMissedYou,
                  style: TextStylesManager.font12Regular,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16.h),
                child: const LoginFormConsumer(),
              ),
            ),
            SliverToBoxAdapter(
              child: PrimaryButton(text: AppStrings.signIn, onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
