import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:deplfolio/features/portfolio/presentation/providers/image_picker_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart' show XFile;

import '../../../../../core/providers/autovalidate_mode_notifier.dart';
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
    final pageIndex = ref.watch(onChangeAddNewProjectPageViewProvider);
    final pickedImg = ref.read(imagePickerNotifierProvider);
    final isLastAddNewProjectPageView = ref.watch(
      isLastAddNewProjectPageProvider,
    );
    final asyncUploadImgToSupabase = ref.watch(uploadImgProvider);
    _uploadNewProjectImgListener(ref, context);
    final asyncAddNewProject = ref.watch(addNewProjectProvider);
    _addNewProjectListener(ref, context);
    return PrimaryButton(
      expands: true,
      onPressed: _onPressed(pageIndex, ref, context),
      text: _buttonText(pageIndex, pickedImg),
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

  String _buttonText(int pageIndex, XFile? pickedImg) {
    switch (pageIndex) {
      case 0:
        return AppStrings.continueWord;
      case 1:
        return pickedImg == null ? AppStrings.pickImg : AppStrings.continueWord;
      case 2:
        return AppStrings.addNewProject;
      default:
        return AppStrings.addNewProject;
    }
  }

  void Function()? _onPressed(
    int pageIndex,
    WidgetRef ref,
    BuildContext context,
  ) {
    switch (pageIndex) {
      case 0:
        return () => _validateNewProjectTitle(ref);
      case 1:
        return () async => await _pickImgAndMoveNext(ref);
      case 2:
        return () => _validateDetailsAndUploadImg(ref);
      default:
        return null;
    }
  }

  Future<void> _pickImgAndMoveNext(WidgetRef ref) async {
    final pickedImg = ref.watch(imagePickerNotifierProvider);
    if (pickedImg == null) {
      await ref.read(imagePickerNotifierProvider.notifier).pickImage();
    } else {
      await _uploadImgAndMoveNext(ref);
    }
  }

  void _validateNewProjectTitle(WidgetRef ref) {
    if (ref.read(addProjectFormKeyProvider).currentState!.validate()) {
      ref.read(onChangeAddNewProjectPageViewProvider.notifier).moveNext();
    } else {
      ref.read(autovalidateModeProvider.notifier).enable();
    }
  }

  Future<void> _validateDetailsAndUploadImg(WidgetRef ref) async {
    if (ref.read(addProjectFormKeyProvider).currentState!.validate()) {
      ref.read(addNewProjectProvider.notifier).validateAndAddProject();
    } else {
      ref.read(autovalidateModeProvider.notifier).enable();
    }
  }

  Future<void> _uploadImgAndMoveNext(WidgetRef ref) async {
    await ref
        .read(uploadImgProvider.notifier)
        .execute(
          path: '${ref.read(addNewProjectTitleProvider).trim()}_icon.png',
        );
    ref.read(onChangeAddNewProjectPageViewProvider.notifier).moveNext();
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
