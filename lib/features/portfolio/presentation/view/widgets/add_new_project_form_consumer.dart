import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadForm;

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/add_new_project_provider.dart';

class AddNewProjectFormConsumer extends ConsumerWidget {
  const AddNewProjectFormConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(addProjectFormKeyProvider);
    return ShadForm(
      key: formKey,
      child: Column(
        spacing: 16.h,
        mainAxisSize: MainAxisSize.min,
        children: const [
          AddNewProjectImgUrlFieldConsumer(),
          AddNewProjectTitleFieldConsumer(),
          AddNewProjectDescriptionFieldConsumer(),
          AddNewProjectDownloadUrlFieldConsumer(),
          AddNewProjectPromoUrlFieldConsumer(),
          AddNewProjectGithubUrlFieldConsumer(),
        ],
      ),
    );
  }
}

class AddNewProjectImgUrlFieldConsumer extends ConsumerWidget {
  const AddNewProjectImgUrlFieldConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    return CustomDataInput(
      autovalidateMode: autovalidateMode,
      labelText: AppStrings.imageUrl,
      textCapitalization: TextCapitalization.none,
      controller: ref.read(addProjectImgUrlControllerProvider),
      validator: (value) => InputValidator.validatingEmptyField(value),
    );
  }
}

class AddNewProjectGithubUrlFieldConsumer extends ConsumerWidget {
  const AddNewProjectGithubUrlFieldConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    return CustomDataInput(
      autovalidateMode: autovalidateMode,
      labelText: AppStrings.githubUrl,
      textCapitalization: TextCapitalization.words,
      controller: ref.read(addProjectGithubUrlPathControllerProvider),
      validator: (value) => InputValidator.validatingEmptyField(value),
    );
  }
}

class AddNewProjectPromoUrlFieldConsumer extends ConsumerWidget {
  const AddNewProjectPromoUrlFieldConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    return CustomDataInput(
      autovalidateMode: autovalidateMode,
      labelText: AppStrings.promoUrl,
      textCapitalization: TextCapitalization.words,
      controller: ref.read(addProjectPromoUrlPathControllerProvider),
      validator: (value) => InputValidator.validatingEmptyField(value),
    );
  }
}

class AddNewProjectDownloadUrlFieldConsumer extends ConsumerWidget {
  const AddNewProjectDownloadUrlFieldConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    return CustomDataInput(
      autovalidateMode: autovalidateMode,
      labelText: AppStrings.downloadUrl,
      textCapitalization: TextCapitalization.words,
      controller: ref.read(addProjectDownloadUrlPathControllerProvider),
      validator: (value) => InputValidator.validatingEmptyField(value),
    );
  }
}

class AddNewProjectDescriptionFieldConsumer extends ConsumerWidget {
  const AddNewProjectDescriptionFieldConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    return CustomDataInput(
      autovalidateMode: autovalidateMode,
      labelText: AppStrings.description,
      textCapitalization: TextCapitalization.words,
      controller: ref.read(addProjectDescriptionControllerProvider),
      validator: (value) => InputValidator.validatingEmptyField(value),
    );
  }
}

class AddNewProjectTitleFieldConsumer extends ConsumerWidget {
  const AddNewProjectTitleFieldConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);

    return CustomDataInput(
      autovalidateMode: autovalidateMode,
      labelText: AppStrings.title,
      textCapitalization: TextCapitalization.words,
      controller: ref.read(addProjectTitleControllerProvider),
      validator: (value) => InputValidator.validatingEmptyField(value),
    );
  }
}
