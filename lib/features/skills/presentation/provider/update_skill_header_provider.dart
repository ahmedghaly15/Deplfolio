import 'package:flutter/material.dart' show GlobalKey;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadFormState;

import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/models/fetch_skills.dart' show SkillHeaderTextModel;
import '../../data/models/update_skill_header_texts_params.dart';
import '../../data/repository/skills_repo.dart';

part 'update_skill_header_provider.g.dart';

@riverpod
GlobalKey<ShadFormState> updateSkillHeaderFormKey() =>
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

@riverpod
class UpdateSkillHeader extends _$UpdateSkillHeader {
  @override
  AsyncValue<void>? build() => null;

  void _update(UpdateSkillHeaderTextsParams params) async {
    final headerSmallText = ref.read(skillHeaderSmallTextProvider);
    final headerBigText1 = ref.read(skillHeaderBigText1Provider);
    final headerColorfulText = ref.read(skillHeaderColorfulTextProvider);
    final headerBigText3 = ref.read(skillHeaderBigText3Provider);
    final targetParams = UpdateSkillHeaderTextsParams(
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
        .updateSkillHeader(targetParams);
    switch (result) {
      case SupabaseRequestSuccess():
        state = const AsyncValue.data(null);
      case SupabaseRequestFailure(:final errorModel):
        state = AsyncValue.error(errorModel.message, StackTrace.current);
    }
  }
}
