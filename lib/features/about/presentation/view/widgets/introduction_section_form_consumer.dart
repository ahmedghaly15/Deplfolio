import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../../data/models/introduction_section.dart';
import '../../providers/introduction_section_form_providers.dart';

class IntroductionSectionFormConsumer extends ConsumerWidget {
  const IntroductionSectionFormConsumer({
    super.key,
    required this.introductionSection,
  });

  final IntroductionSection introductionSection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(introductionSectionFormKeyProvider);
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    return ShadForm(
      key: formKey,
      child: Column(
        spacing: 16.h,
        children: [
          Container(
            margin: EdgeInsets.only(top: 16.h),
            child: CustomDataInput(
              autovalidateMode: autovalidateMode,
              initialValue: introductionSection.headerSmallText,
              labelText: AppStrings.headerSmallText,
              textCapitalization: TextCapitalization.sentences,
              validator: (value) => InputValidator.validatingEmptyField(value),
              onChanged: (value) {
                ref.read(aboutHeaderSmallTxtProvider.notifier).state = value;
              },
            ),
          ),
          CustomDataInput(
            initialValue: introductionSection.description,
            autovalidateMode: autovalidateMode,
            labelText: AppStrings.myDescription,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) => InputValidator.validatingEmptyField(value),
            onChanged: (value) {
              ref.read(aboutDescriptionProvider.notifier).state = value;
            },
          ),
          CustomDataInput(
            initialValue: introductionSection.seeMyWorkLink,
            autovalidateMode: autovalidateMode,
            labelText: AppStrings.seeMyWorkUrl,
            validator: (value) => InputValidator.validatingUrlField(value),
            onChanged: (value) {
              ref.read(aboutSeeMyWorkLinkProvider.notifier).state = value;
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 8.h),
            child: const Text(AppStrings.headerBigText),
          ),
          CustomDataInput(
            autovalidateMode: autovalidateMode,
            labelText: AppStrings.headerBigText1,
            initialValue: introductionSection.headerBigText.text1,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) => InputValidator.validatingEmptyField(value),
            onChanged: (value) {
              ref.read(aboutHeaderBigText1Provider.notifier).state = value;
            },
          ),
          CustomDataInput(
            autovalidateMode: autovalidateMode,
            labelText: AppStrings.headerBigText2,
            initialValue: introductionSection.headerBigText.text2,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) => InputValidator.validatingEmptyField(value),
            onChanged: (value) {
              ref.read(aboutHeaderBigText2Provider.notifier).state = value;
            },
          ),
          CustomDataInput(
            autovalidateMode: autovalidateMode,
            labelText: AppStrings.headerBigTextColoredString,
            initialValue: introductionSection.headerBigText.coloredString,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) => InputValidator.validatingEmptyField(value),
            onChanged: (value) {
              ref.read(aboutHeaderBigTextColoredStringProvider.notifier).state =
                  value;
            },
          ),
        ],
      ),
    );
  }
}
