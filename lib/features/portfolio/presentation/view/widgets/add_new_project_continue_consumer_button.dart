import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/add_new_project_page_view_providers.dart';
import '../../providers/add_new_project_provider.dart';
import '../../providers/fetch_portfolio_provider.dart'
    show fetchPortfolioProvider;
import '../../providers/upload_img_provider.dart';

class AddNewProjectContinueConsumerButton extends ConsumerWidget {
  const AddNewProjectContinueConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLastAddNewProjectPageView = ref.watch(
      isLastAddNewProjectPageProvider,
    );
    final asyncUploadImgToSupabase = ref.watch(uploadImgProvider);
    _uploadNewProjectImgListener(ref, context);
    final asyncAddNewProject = ref.watch(addNewProjectProvider);
    _addNewProjectListener(ref, context);
    return PrimaryButton(
      onPressed:
          isLastAddNewProjectPageView
              ? () => ref.read(uploadImgProvider.notifier).execute()
              : () =>
                  ref
                      .read(addNewProjectProvider.notifier)
                      .validateAndAddProject(),
      text:
          isLastAddNewProjectPageView
              ? AppStrings.addNewProject
              : AppStrings.continueWord,
      child:
          isLastAddNewProjectPageView
              ? asyncAddNewProject?.whenOrNull(
                loading: () => const AdaptiveCircularProgressIndicator(),
              )
              : asyncUploadImgToSupabase.whenOrNull(
                loading: () => const AdaptiveCircularProgressIndicator(),
              ),
    );
  }

  void _addNewProjectListener(WidgetRef ref, BuildContext context) {
    ref.listen(addNewProjectProvider, (_, current) {
      current?.whenOrNull(
        error: (error, _) => context.showToast(error.toString()),
        data: (_) {
          ref.invalidate(fetchPortfolioProvider);
          context.popTop();
          context.showToast(AppStrings.projectAddedSuccessfully);
        },
      );
    });
  }

  void _uploadNewProjectImgListener(WidgetRef ref, BuildContext context) {
    ref.listen(uploadImgProvider, (_, current) {
      current.whenOrNull(
        error: (error, _) => context.showToast(error.toString()),
        data: (imgUrl) async {
          ref.read(addNewProjectImgUrlProvider.notifier).state = imgUrl;
          await ref
              .read(onChangeAddNewProjectPageViewProvider.notifier)
              .moveNext();
        },
      );
    });
  }
}
