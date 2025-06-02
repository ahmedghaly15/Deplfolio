import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

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
    _listener(ref, context);
    return PrimaryButton(
      text: AppStrings.saveChanges,
      onPressed:
          didValuesChange
              ? () {
                ref
                    .read(updateIntroductionSectionProvider.notifier)
                    .validateAndUpdate(introductionSection);
              }
              : null,
      child: asyncUpdate?.whenOrNull(
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
    );
  }

  void _listener(WidgetRef ref, BuildContext context) {
    ref.listen(updateIntroductionSectionProvider, (_, current) {
      current?.whenOrNull(
        error: (error, _) => context.showToast(error.toString()),
        data: (_) => context.showToast(AppStrings.aboutDataUpdateSuccess),
      );
    });
  }
}
