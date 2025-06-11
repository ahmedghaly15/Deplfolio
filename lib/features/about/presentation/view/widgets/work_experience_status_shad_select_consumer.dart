import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../core/enums/experience_status.dart' show ExperienceStatus;
import '../../../../../core/utils/app_strings.dart';
import '../../providers/update_work_experience_provider.dart';

class WorkExperienceStatusShadSelectConsumer extends ConsumerWidget {
  const WorkExperienceStatusShadSelectConsumer({
    super.key,
    required this.experienceStatus,
  });

  final ExperienceStatus experienceStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusProviderValue = ref.watch(
      workExperienceStatusProvider(experienceStatus),
    );
    return ShadSelect<ExperienceStatus>(
      itemCount: ExperienceStatus.values.length,
      decoration: context.shadTheme.inputTheme.decoration,
      options: [
        ...ExperienceStatus.values.map(
          (e) => ShadOption(value: e, child: Text(e.getName)),
        ),
      ],
      selectedOptionBuilder: (_, status) => Text(status.getName),
      initialValue: experienceStatus,
      placeholder: const Text(AppStrings.selectStatus),
      onChanged: (value) {
        // comparing new value with old state stored in provider
        if (value != statusProviderValue && value != null) {
          ref
              .read(workExperienceStatusProvider(experienceStatus).notifier)
              .state = value;
        }
      },
    );
  }
}
