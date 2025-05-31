import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/helpers/cache_helper.dart';
import '../../../../../core/router/routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/cache_keys.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/login_provider.dart';

class LoginConsumerButton extends ConsumerWidget {
  const LoginConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLogin = ref.watch(loginProvider);
    _listener(ref, context);
    return PrimaryButton(
      text: AppStrings.signIn,
      onPressed: () => ref.read(loginProvider.notifier).validateFormAndLogin(),
      child: asyncLogin?.whenOrNull(
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
    );
  }

  void _listener(WidgetRef ref, BuildContext context) {
    ref.listen(loginProvider, (_, current) {
      current?.whenOrNull(
        loading: () => context.unfocusKeyboard(),
        data: (userId) async => await _onLoginSuccess(userId, context),
        error: (error, _) => context.showToast(error.toString()),
      );
    });
  }

  Future<void> _onLoginSuccess(String userId, BuildContext context) async {
    await CacheHelper.setSecuredString(CacheKeys.userId, userId);
    context.pushReplacementNamed(Routes.layout);
  }
}
