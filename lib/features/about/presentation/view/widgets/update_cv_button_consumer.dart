import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/upload_cv_to_repo.dart';

class UpdateCvButtonConsumer extends ConsumerWidget {
  const UpdateCvButtonConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUploadCvToRepo = ref.watch(uploadCvToRepoProvider);
    _listener(ref, context);
    return PrimaryButton(
      onPressed: () => ref.read(uploadCvToRepoProvider.notifier).upload(),
      text: AppStrings.updateCv,
      child: asyncUploadCvToRepo?.whenOrNull(
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
    );
  }

  void _listener(WidgetRef ref, BuildContext context) {
    ref.listen(uploadCvToRepoProvider, (_, current) {
      current?.whenOrNull(
        error: (error, _) => context.showToast(error.toString()),
        data: (_) => context.showToast(AppStrings.cvUpdatedSuccessfully),
      );
    });
  }
}
