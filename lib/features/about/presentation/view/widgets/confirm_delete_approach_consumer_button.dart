import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../core/local_data_source/local_data_refresher.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/delete_approach_provider.dart';

class ConfirmDeleteApproachConsumerButton extends ConsumerWidget {
  const ConfirmDeleteApproachConsumerButton({
    super.key,
    required this.approachId,
  });

  final String approachId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncDeleteApproach = ref.watch(deleteApproachProvider);
    _deleteApproachProviderListener(ref, context);
    return PrimaryButton(
      size: ShadButtonSize.sm,
      decoration: ShadDecoration(
        border: ShadBorder(radius: BorderRadius.all(Radius.circular(8.r))),
      ),
      onPressed: () {
        ref.read(deleteApproachProvider.notifier).execute(approachId);
      },
      text: AppStrings.confirm,
      child: asyncDeleteApproach?.whenOrNull(
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
    );
  }

  void _deleteApproachProviderListener(WidgetRef ref, BuildContext context) {
    ref.listen(deleteApproachProvider, (_, current) {
      current?.whenOrNull(
        data: (_) {
          LocalDataRefresher.refreshAboutProvider(ref);
          context.pop();
          context.showToast(AppStrings.approachDeletedSuccessfully);
        },
        error: (error, _) => context.showToast(error.toString()),
      );
    });
  }
}
