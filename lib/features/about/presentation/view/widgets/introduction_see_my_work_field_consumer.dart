import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart'
    show autovalidateModeProvider;
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/introduction_section_form_providers.dart'
    show aboutSeeMyWorkLinkProvider;

class IntroductionSeeMyWorkFieldConsumer extends ConsumerWidget {
  const IntroductionSeeMyWorkFieldConsumer({
    super.key,
    required this.seeMyWorkLink,
  });

  final String seeMyWorkLink;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    return CustomDataInput(
      initialValue: seeMyWorkLink,
      autovalidateMode: autovalidateMode,
      labelText: AppStrings.seeMyWorkUrl,
      validator: (value) => InputValidator.validatingUrlField(value),
      onChanged: (value) {
        ref.read(aboutSeeMyWorkLinkProvider.notifier).state = value;
      },
    );
  }
}
