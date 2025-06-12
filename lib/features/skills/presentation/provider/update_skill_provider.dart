import 'package:flutter/material.dart' show GlobalKey;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadFormState;

import '../../../../core/providers/autovalidate_mode_notifier.dart'
    show autovalidateModeProvider;
import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/models/fetch_skills.dart' show SkillModel;
import '../../data/repository/skills_repo.dart';

part 'update_skill_provider.g.dart';

@riverpod
GlobalKey<ShadFormState> updateSkillFormKey(Ref ref) =>
    GlobalKey<ShadFormState>();

final skillNameProvider = StateProvider.autoDispose<String>((ref) => '');
final skillPercentProvider = StateProvider.autoDispose<String>((ref) => '');

@riverpod
class UpdateSkill extends _$UpdateSkill {
  @override
  AsyncValue<void>? build() => null;

  void _update(SkillModel skill) async {
    final nameProviderValue = ref.read(skillNameProvider);
    final percentProviderValue = ref.read(skillPercentProvider);
    final targetSkill = SkillModel(
      id: skill.id,
      name:
          nameProviderValue.isEmpty
              ? skill.name.trim()
              : nameProviderValue.trim(),
      percentage:
          percentProviderValue.isEmpty
              ? skill.percentage
              : double.parse(percentProviderValue.trim()),
    );
    state = const AsyncLoading();
    final result = await ref
        .read(skillsRepoProvider)
        .updateSkill(ref, targetSkill);
    switch (result) {
      case SupabaseRequestSuccess():
        state = const AsyncData<void>(null);
        break;
      case SupabaseRequestFailure(:final errorModel):
        state = AsyncError(errorModel.message, StackTrace.current);
    }
  }

  void validateAndUpdate(SkillModel skill) {
    final formKey = ref.read(updateSkillFormKeyProvider);
    if (formKey.currentState!.validate()) {
      _update(skill);
    } else {
      ref.read(autovalidateModeProvider.notifier).enable();
    }
  }
}
