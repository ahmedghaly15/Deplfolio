import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart' show XFile;

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/models/project.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/image_picker_providers.dart'
    show imagePickerNotifierProvider;
import '../../providers/update_project_img.dart';
import '../../providers/update_project_provider.dart';
import '../../providers/upload_img_to_github_provider.dart';

class EditProjectConsumerButton extends ConsumerWidget {
  const EditProjectConsumerButton({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isButtonEnabled = ref.watch(
      isUpdateProjectButtonEnabledProvider(project),
    );
    final pickedImg = ref.watch(imagePickerNotifierProvider);
    final asyncUpdateProject = ref.watch(updateProjectProvider);
    final asyncUploadImgToGithub = ref.watch(uploadImgToGithubProvider);
    _updateProjectProviderListener(pickedImg, ref, context);
    _updateProjectImgProviderListener(ref, context);
    _uploadImgToGithubProviderListener(ref, context);
    return PrimaryButton(
      text: pickedImg != null ? AppStrings.updateImg : AppStrings.editProject,
      onPressed: _onPressed(pickedImg, ref, isButtonEnabled),
      child: _buildAdaptiveLoadingIndicator(
        pickedImg,
        asyncUploadImgToGithub,
        asyncUpdateProject,
      ),
    );
  }

  VoidCallback? _onPressed(
    XFile? pickedImg,
    WidgetRef ref,
    bool isButtonEnabled,
  ) {
    if (pickedImg != null) {
      return () {
        ref.read(uploadImgToGithubProvider.notifier).execute(project.title);
      };
    } else {
      return (isButtonEnabled
          ? () {
            ref.read(updateProjectProvider.notifier).validateAndUpdate(project);
          }
          : null);
    }
  }

  Widget? _buildAdaptiveLoadingIndicator(
    XFile? pickedImg,
    AsyncValue<void>? asyncUploadImgToGithub,
    AsyncValue<void>? asyncUpdateProject,
  ) {
    return pickedImg != null
        ? asyncUploadImgToGithub?.whenOrNull(
          loading: () => const AdaptiveCircularProgressIndicator(),
        )
        : asyncUpdateProject?.whenOrNull(
          loading: () => const AdaptiveCircularProgressIndicator(),
        );
  }

  void _updateProjectProviderListener(
    XFile? pickedImg,
    WidgetRef ref,
    BuildContext context,
  ) {
    if (pickedImg == null) {
      ref.listen(updateProjectProvider, (_, current) {
        current?.whenOrNull(
          data: (_) => context.showToast(AppStrings.projectUpdatedSuccessfully),
          error: (error, _) => context.showToast(error.toString()),
        );
      });
    }
  }

  void _uploadImgToGithubProviderListener(WidgetRef ref, BuildContext context) {
    ref.listen(uploadImgToGithubProvider, (_, current) {
      current?.whenOrNull(
        data:
            (_) async => await ref
                .read(updateProjectImgProvider.notifier)
                .execute(project.title),
        error: (error, _) => context.showToast(error.toString()),
      );
    });
  }

  void _updateProjectImgProviderListener(WidgetRef ref, BuildContext context) {
    ref.listen(updateProjectImgProvider, (_, current) {
      current.whenOrNull(
        data:
            (imgUrl) async =>
                await _onUpdateProjectImgSuccess(ref, imgUrl, context),
        error: (error, _) => context.showToast(error.toString()),
      );
    });
  }

  Future<void> _onUpdateProjectImgSuccess(
    WidgetRef ref,
    String imgUrl,
    BuildContext context,
  ) async {
    ref.read(projectImgPathProvider(project.imgPath).notifier).state = imgUrl;
    await ref
        .read(updateProjectProvider.notifier)
        .update(project.copyWith(imgPath: imgUrl));
    context.showToast(AppStrings.imgUpdatedSuccessfully);
  }
}
