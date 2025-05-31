import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_input_form_field.dart';
import '../../providers/form_providers.dart'
    show emailControllerProvider, autovalidateModeProvider;

class EmailFieldConsumer extends ConsumerWidget {
  const EmailFieldConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = ref.watch(emailControllerProvider);
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    return CustomInputFormField(
      autovalidateMode: autovalidateMode,
      leading: const Icon(LucideIcons.mail),
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      label: const Text(AppStrings.email),
      placeholder: const Text(AppStrings.enterYourEmail),
      textCapitalization: TextCapitalization.none,
      validator: (value) => InputValidator.validatingEmailField(value),
      autofillHints: const [AutofillHints.email],
    );
  }
}
