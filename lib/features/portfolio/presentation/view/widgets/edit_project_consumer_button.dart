import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/models/project.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/update_project_provider.dart';

class EditProjectConsumerButton extends ConsumerWidget {
  const EditProjectConsumerButton({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUpdate = ref.watch(updateProjectProvider);
    _listener(ref, context);
    return PrimaryButton(
      text: AppStrings.editProject,
      onPressed: () {
        ref.read(updateProjectProvider.notifier).validateAndUpdate(project);
      },
      child: asyncUpdate?.whenOrNull(
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
    );
  }

  void _listener(WidgetRef ref, BuildContext context) {
    ref.listen(updateProjectProvider, (_, current) {
      current?.whenOrNull(
        data: (_) => context.showToast(AppStrings.projectUpdatedSuccessfully),
        error: (error, _) => context.showToast(error.toString()),
      );
    });
  }
}
