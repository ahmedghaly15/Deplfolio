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
    final asyncUploadImg = ref.watch(updateProjectImgProvider);
    _updateProjectProviderListener(ref, context);
    _updateProjectImgProviderListener(ref, context);
    return PrimaryButton(
      text: pickedImg != null ? AppStrings.updateImg : AppStrings.editProject,
      onPressed: _onPressed(pickedImg, ref, isButtonEnabled),
      child: _buildAdaptiveLoadingIndicator(
        pickedImg,
        asyncUploadImg,
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
        ref.read(updateProjectImgProvider.notifier).execute(project.title);
      };
    } else {
      return (isButtonEnabled
          ? () {
            ref.read(updateProjectProvider.notifier).validateAndUpdate(project);
          }
          : null);
    }
  }

  void _updateProjectImgProviderListener(WidgetRef ref, BuildContext context) {
    ref.listen(updateProjectImgProvider, (_, current) {
      current.whenOrNull(
        data: (imgUrl) async {
          print('IMG URL: $imgUrl');
          ref.read(projectImgPathProvider(project.imgPath).notifier).state =
              imgUrl;
          await ref
              .read(updateProjectProvider.notifier)
              .update(project.copyWith(imgPath: imgUrl));
          context.showToast(AppStrings.imgUpdatedSuccessfully);
        },
        error: (error, _) => context.showToast(error.toString()),
      );
    });
  }

  Widget? _buildAdaptiveLoadingIndicator(
    XFile? pickedImg,
    AsyncValue<String> asyncUploadImg,
    AsyncValue<void>? asyncUpdateProject,
  ) {
    return pickedImg != null
        ? asyncUploadImg.whenOrNull(
          loading: () => const AdaptiveCircularProgressIndicator(),
        )
        : asyncUpdateProject?.whenOrNull(
          loading: () => const AdaptiveCircularProgressIndicator(),
        );
  }

  void _updateProjectProviderListener(WidgetRef ref, BuildContext context) {
    ref.listen(updateProjectProvider, (_, current) {
      current?.whenOrNull(
        data: (_) => context.showToast(AppStrings.projectUpdatedSuccessfully),
        error: (error, _) => context.showToast(error.toString()),
      );
    });
  }
}
