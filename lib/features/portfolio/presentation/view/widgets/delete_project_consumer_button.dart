import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/local_data_source/local_data_refresher.dart';
import '../../../../../core/models/project.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/delete_project_provider.dart';

class DeleteProjectConsumerButton extends ConsumerWidget {
  const DeleteProjectConsumerButton({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncDeleteProject = ref.watch(deleteProjectProvider);
    _deleteProjectProviderListener(ref, context);
    return PrimaryButton(
      text: AppStrings.confirm,
      onPressed:
          () => ref.read(deleteProjectProvider.notifier).execute(project.id),
      child: asyncDeleteProject?.whenOrNull(
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
    );
  }

  void _deleteProjectProviderListener(WidgetRef ref, BuildContext context) {
    ref.listen(deleteProjectProvider, (_, current) {
      current?.whenOrNull(
        data: (_) async => await _showToastAndRefreshData(context, ref),
        error: (error, _) => context.showToast(error.toString()),
      );
    });
  }

  Future<void> _showToastAndRefreshData(
    BuildContext context,
    WidgetRef ref,
  ) async {
    await Future.wait([
      LocalDataRefresher.refreshAboutProvider(ref),
      LocalDataRefresher.refreshPortfolioProvider(ref),
    ]);
    context.showToast('${project.title} ${AppStrings.deletedSuccessfully}');
    context.popTop();
  }
}
