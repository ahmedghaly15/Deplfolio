import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_input_form_field.dart';
import '../../providers/form_providers.dart'
    show passControllerProvider, passToggleProvider;

class PassInputFieldConsumer extends ConsumerWidget {
  const PassInputFieldConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passController = ref.watch(passControllerProvider);
    final isObscure = ref.watch(passToggleProvider);
    return CustomInputFormField(
      leading: const Icon(LucideIcons.lock),
      controller: passController,
      keyboardType: TextInputType.visiblePassword,
      label: const Text(AppStrings.password),
      placeholder: const Text(AppStrings.enterYourPassword),
      textCapitalization: TextCapitalization.none,
      validating: (value) => InputValidator.validatingPasswordField(value),
      autofillHints: const [AutofillHints.password],
      obscureText: isObscure,
      trailing: IconButton(
        onPressed: () => ref.read(passToggleProvider.notifier).toggle(),
        icon: Icon(isObscure ? LucideIcons.eye : LucideIcons.eyeOff),
      ),
    );
  }
}
