import 'package:flutter/material.dart' show GlobalKey;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadFormState;

import '../../../../core/providers/autovalidate_mode_notifier.dart'
    show autovalidateModeProvider;
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/generate_random_id.dart';
import '../../data/models/fetch_skills.dart' show SkillModel;
import '../../data/repository/skills_repo.dart';

part 'add_skill_provider.g.dart';

@riverpod
GlobalKey<ShadFormState> addSkillFormKey() => GlobalKey<ShadFormState>();

final skillNameProvider = StateProvider.autoDispose<String>((ref) => '');
final skillPercentProvider = StateProvider.autoDispose<String>((ref) => '');

@riverpod
class AddSkill extends _$AddSkill {
  @override
  AsyncValue<void>? build() => null;

  void _add() async {
    final skillName = ref.read(skillNameProvider);
    final skillPercent = ref.read(skillPercentProvider);
    state = const AsyncValue.loading();
    final result = await ref
        .read(skillsRepoProvider)
        .addSkill(
          ref,
          SkillModel(
            id: generateRandomId(),
            name: skillName,
            percent: double.parse(skillPercent),
          ),
        );
    switch (result) {
      case SupabaseRequestSuccess():
        state = const AsyncValue.data(null);
      case SupabaseRequestFailure(:final errorModel):
        state = AsyncValue.error(errorModel.message, StackTrace.current);
    }
  }

  void validateAndAdd() async {
    final formKey = ref.read(addSkillFormKeyProvider);
    if (formKey.currentState!.validate()) {
      _add();
    } else {
      ref.read(autovalidateModeProvider.notifier).enable();
    }
  }
}
