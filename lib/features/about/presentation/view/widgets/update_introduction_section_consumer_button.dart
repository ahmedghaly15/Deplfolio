import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../data/models/introduction_section.dart';
import '../../providers/introduction_section_form_providers.dart';
import '../../providers/update_introduction_section_provider.dart';

class UpdateIntroductionSectionConsumerButton extends ConsumerWidget {
  const UpdateIntroductionSectionConsumerButton({
    super.key,
    required this.introductionSection,
  });

  final IntroductionSection introductionSection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUpdate = ref.watch(updateIntroductionSectionProvider);
    final didValuesChange = ref.watch(
      isUpdateIntroductionButtonEnabledProvider(introductionSection),
    );
    return PrimaryButton(
      expands: true,
      text: AppStrings.saveChanges,
      onPressed:
          didValuesChange
              ? () {
                ref
                    .read(updateIntroductionSectionProvider.notifier)
                    .validateAndUpdate();
              }
              : null,
      child: asyncUpdate?.whenOrNull(
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
    );
  }
}
