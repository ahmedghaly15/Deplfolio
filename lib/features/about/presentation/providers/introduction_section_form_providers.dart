import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadFormState;

import '../../data/models/introduction_section.dart';

part 'introduction_section_form_providers.g.dart';

@riverpod
GlobalKey<ShadFormState> introductionSectionFormKey(Ref ref) =>
    GlobalKey<ShadFormState>();

final aboutHeaderSmallTxtProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);

final aboutDescriptionProvider = StateProvider.autoDispose<String>((ref) => '');

final aboutSeeMyWorkLinkProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);

final aboutHeaderBigText1Provider = StateProvider.autoDispose<String>(
  (ref) => '',
);

final aboutHeaderBigText2Provider = StateProvider.autoDispose<String>(
  (ref) => '',
);

final aboutHeaderBigTextColoredStringProvider =
    StateProvider.autoDispose<String>((ref) => '');

final isUpdateIntroductionButtonEnabledProvider = StateProvider.autoDispose
    .family<bool, IntroductionSection>((ref, initialValues) {
      final headerSmallText = ref.watch(aboutHeaderSmallTxtProvider);
      final descriptionText = ref.watch(aboutDescriptionProvider);
      final linkText = ref.watch(aboutSeeMyWorkLinkProvider);
      final bigText1 = ref.watch(aboutHeaderBigText1Provider);
      final bigText2 = ref.watch(aboutHeaderBigText2Provider);
      final coloredText = ref.watch(aboutHeaderBigTextColoredStringProvider);

      final hasChanged =
          (headerSmallText.isNotEmpty &&
              headerSmallText != initialValues.headerSmallText) ||
          (descriptionText.isNotEmpty &&
              descriptionText != initialValues.description) ||
          (linkText.isNotEmpty && linkText != initialValues.seeMyWorkLink) ||
          (bigText1.isNotEmpty &&
              bigText1 != initialValues.headerBigText.text1) ||
          (bigText2.isNotEmpty &&
              bigText2 != initialValues.headerBigText.text2) ||
          (coloredText.isNotEmpty &&
              coloredText != initialValues.headerBigText.coloredString);

      return hasChanged;
    });
