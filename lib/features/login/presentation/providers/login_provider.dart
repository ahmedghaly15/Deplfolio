// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/models/login_request_params.dart';
import '../../data/repository/login_repo.dart';
import 'form_providers.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  @override
  AsyncValue<String>? build() => null;

  void _login() async {
    state = const AsyncValue.loading();
    final result = await ref
        .read(loginRepoProvider)
        .loginViaEmailAndPass(
          ref,
          LoginRequestParams(
            email: ref.read(emailControllerProvider).text,
            password: ref.read(passControllerProvider).text.trim(),
          ),
        );
    switch (result) {
      case SupabaseRequestSuccess(data: final userId):
        state = AsyncValue.data(userId);
      case SupabaseRequestFailure(:final errorModel):
        state = AsyncValue.error(errorModel.message, StackTrace.current);
    }
  }

  void validateFormAndLogin() {
    final formKey = ref.read(loginFormKeyProvider);
    if (formKey.currentState!.validate()) {
      _login();
    } else {
      ref.read(autovalidateModeProvider.notifier).enable();
    }
  }
}
