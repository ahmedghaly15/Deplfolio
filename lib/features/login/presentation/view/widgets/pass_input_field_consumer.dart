import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_input_form_field.dart';
import '../../providers/form_providers.dart';

class PassInputFieldConsumer extends ConsumerWidget {
  const PassInputFieldConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passController = ref.watch(passControllerProvider);
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    final isObscure = ref.watch(passToggleProvider);
    final focusNode = ref.read(passFocusNodeProvider);
    return CustomInputFormField(
      autovalidateMode: autovalidateMode,
      leading: const Icon(LucideIcons.lock),
      controller: passController,
      focusNode: focusNode,
      keyboardType: TextInputType.visiblePassword,
      label: const Text(AppStrings.password),
      placeholder: const Text(AppStrings.enterYourPassword),
      textCapitalization: TextCapitalization.none,
      validator: (value) => InputValidator.validatingPasswordField(value),
      autofillHints: const [AutofillHints.password],
      obscureText: isObscure,
      trailing: InkWell(
        onTap: () => ref.read(passToggleProvider.notifier).toggle(),
        child: Icon(isObscure ? LucideIcons.eye : LucideIcons.eyeOff),
      ),
    );
  }
}
