import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

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
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: ShadCard(
                  columnCrossAxisAlignment: CrossAxisAlignment.stretch,
                  title: Text(
                    AppStrings.welcomeBack,
                    style: context.shadTextTheme.h4,
                  ),
                  description: const Text(AppStrings.welcomeBackWeMissedYou),
                  footer: Container(
                    margin: EdgeInsets.only(top: 24.h),
                    child: const LoginConsumerButton(),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 16.h),
                    child: const LoginFormConsumer(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
