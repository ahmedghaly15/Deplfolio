// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart' show GlobalKey;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadFormState;

import '../../../../core/providers/autovalidate_mode_notifier.dart'
    show autovalidateModeProvider;
import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/models/fetch_skills.dart' show SkillHeaderTextModel;
import '../../data/models/skills_texts.dart';
import '../../data/repository/skills_repo.dart';

part 'update_skill_header_provider.g.dart';

@riverpod
GlobalKey<ShadFormState> updateSkillHeaderFormKey(Ref ref) =>
    GlobalKey<ShadFormState>();

final skillHeaderSmallTextProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);
final skillHeaderBigText1Provider = StateProvider.autoDispose<String>(
  (ref) => '',
);
final skillHeaderColorfulTextProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);
final skillHeaderBigText3Provider = StateProvider.autoDispose<String>(
  (ref) => '',
);

final isUpdateSkillHeaderButtonEnabled = StateProvider.autoDispose
    .family<bool, SkillsTexts>((ref, initialValue) {
      final headerSmallText = ref.watch(skillHeaderSmallTextProvider);
      final headerBigText1 = ref.watch(skillHeaderBigText1Provider);
      final headerColorfulText = ref.watch(skillHeaderColorfulTextProvider);
      final headerBigText3 = ref.watch(skillHeaderBigText3Provider);

      final hasChanged =
          (headerSmallText.isNotEmpty &&
              headerSmallText != initialValue.headerSmallText) ||
          (headerBigText1.isNotEmpty &&
              headerBigText1 != initialValue.headerBigText.text1) ||
          (headerColorfulText.isNotEmpty &&
              headerColorfulText !=
                  initialValue.headerBigText.colorfulString) ||
          (headerBigText3.isNotEmpty &&
              headerBigText3 != initialValue.headerBigText.text3);
      return hasChanged;
    });

@riverpod
class UpdateSkillHeader extends _$UpdateSkillHeader {
  @override
  AsyncValue<void>? build() => null;

  void _update(SkillsTexts params) async {
    final headerSmallText = ref.read(skillHeaderSmallTextProvider);
    final headerBigText1 = ref.read(skillHeaderBigText1Provider);
    final headerColorfulText = ref.read(skillHeaderColorfulTextProvider);
    final headerBigText3 = ref.read(skillHeaderBigText3Provider);
    final targetParams = SkillsTexts(
      headerSmallText:
          headerSmallText.isEmpty
              ? params.headerSmallText.trim()
              : headerSmallText.trim(),
      headerBigText: SkillHeaderTextModel(
        text1:
            headerBigText1.isEmpty
                ? params.headerBigText.text1.trim()
                : headerBigText1.trim(),
        colorfulString:
            headerColorfulText.isEmpty
                ? params.headerBigText.colorfulString.trim()
                : headerColorfulText.trim(),
        text3:
            headerBigText3.isEmpty
                ? params.headerBigText.text3.trim()
                : headerBigText3.trim(),
      ),
    );
    state = const AsyncValue.loading();
    final result = await ref
        .read(skillsRepoProvider)
        .updateSkillHeader(ref, targetParams);
    switch (result) {
      case SupabaseRequestSuccess():
        state = const AsyncValue.data(null);
      case SupabaseRequestFailure(:final errorModel):
        state = AsyncValue.error(errorModel.message, StackTrace.current);
    }
  }

  void validateAndUpdate(SkillsTexts params) {
    final formKey = ref.read(updateSkillHeaderFormKeyProvider);
    if (formKey.currentState!.validate()) {
      _update(params);
    } else {
      ref.read(autovalidateModeProvider.notifier).enable();
    }
  }
}
