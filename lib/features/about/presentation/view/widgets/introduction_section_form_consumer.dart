import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../data/models/introduction_section.dart';
import '../../provider/about_provider.dart';

class IntroductionSectionFormConsumer extends ConsumerWidget {
  const IntroductionSectionFormConsumer({
    super.key,
    required this.introductionSection,
  });

  final IntroductionSection introductionSection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(introductionSectionFormKeyProvider);
    final headerSmallTxtController = ref.watch(
      aboutHeaderSmallTxtControllerProvider,
    );
    final descriptionController = ref.watch(aboutDescriptionControllerProvider);
    final seeMyWorkLinkController = ref.watch(
      aboutSeeMyWorkLinkControllerProvider,
    );
    final headerBigText1Controller = ref.watch(
      aboutHeaderBigText1ControllerProvider,
    );
    final headerBigText2Controller = ref.watch(
      aboutHeaderBigText2ControllerProvider,
    );
    final headerBigTextColoredStringController = ref.watch(
      aboutHeaderBigTextColoredStringControllerProvider,
    );
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    return ShadForm(
      key: formKey,
      child: Column(
        spacing: 16.h,
        children: [
          Container(
            margin: EdgeInsets.only(top: 16.h),
            child: CustomDataInput(
              controller: headerSmallTxtController,
              autovalidateMode: autovalidateMode,
              initialValue: introductionSection.headerSmallText,
              labelText: AppStrings.headerSmallText,
              textCapitalization: TextCapitalization.sentences,
              validator: (value) => InputValidator.validatingEmptyField(value),
            ),
          ),
          CustomDataInput(
            initialValue: introductionSection.description,
            controller: descriptionController,
            autovalidateMode: autovalidateMode,
            labelText: AppStrings.myDescription,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) => InputValidator.validatingEmptyField(value),
          ),
          CustomDataInput(
            initialValue: introductionSection.seeMyWorkLink,
            controller: seeMyWorkLinkController,
            autovalidateMode: autovalidateMode,
            labelText: AppStrings.seeMyWorkUrl,
            validator: (value) => InputValidator.validatingUrlField(value),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.h),
            child: const Text(AppStrings.headerBigText),
          ),
          CustomDataInput(
            controller: headerBigText1Controller,
            autovalidateMode: autovalidateMode,
            labelText: AppStrings.headerBigText1,
            initialValue: introductionSection.headerBigText.text1,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) => InputValidator.validatingEmptyField(value),
          ),
          CustomDataInput(
            controller: headerBigText2Controller,
            autovalidateMode: autovalidateMode,
            labelText: AppStrings.headerBigText2,
            initialValue: introductionSection.headerBigText.text2,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) => InputValidator.validatingEmptyField(value),
          ),
          CustomDataInput(
            controller: headerBigTextColoredStringController,
            autovalidateMode: autovalidateMode,
            labelText: AppStrings.headerBigTextColoredString,
            initialValue: introductionSection.headerBigText.coloredString,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) => InputValidator.validatingEmptyField(value),
          ),
          Container(
            margin: EdgeInsets.only(top: 16.h),
            child: PrimaryButton(
              expands: true,
              text: AppStrings.saveChanges,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
