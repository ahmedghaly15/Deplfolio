import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/text_styles_manager.dart';
import '../../../../core/utils/app_strings.dart';
import 'widgets/login_consumer_button.dart';
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
                margin: EdgeInsets.only(top: 16.h, bottom: 32.h),
                child: const LoginFormConsumer(),
              ),
            ),
            const SliverToBoxAdapter(child: LoginConsumerButton()),
          ],
        ),
      ),
    );
  }
}
