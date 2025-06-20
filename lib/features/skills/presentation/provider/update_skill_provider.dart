// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
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

final updateSkillNameProvider = StateProvider.autoDispose
    .family<String, String>((ref, initialValue) => initialValue);
final updateSkillPercentProvider = StateProvider.autoDispose
    .family<double, double>((ref, initialValue) => initialValue);

final isUpdateSkillButtonEnabledProvider = StateProvider.autoDispose
    .family<bool, SkillModel>((ref, skill) {
      final nameProviderValue = ref.watch(updateSkillNameProvider(skill.name));
      final percentProviderValue = ref.watch(
        updateSkillPercentProvider(skill.percent),
      );
      return (nameProviderValue.isNotEmpty ||
              nameProviderValue != skill.name) &&
          (percentProviderValue != skill.percent);
    });

@riverpod
class UpdateSkill extends _$UpdateSkill {
  @override
  AsyncValue<void>? build() => null;

  void _update(SkillModel skill) async {
    final nameProviderValue = ref.read(updateSkillNameProvider(skill.name));
    final percentProviderValue = ref.read(
      updateSkillPercentProvider(skill.percent),
    );
    final targetSkill = SkillModel(
      id: skill.id,
      name:
          nameProviderValue.isEmpty
              ? skill.name.trim()
              : nameProviderValue.trim(),
      percent:
          percentProviderValue != skill.percent
              ? percentProviderValue
              : skill.percent,
    );
    state = const AsyncLoading();
    final result = await ref
        .read(skillsRepoProvider)
        .updateSkill(ref, targetSkill);
    switch (result) {
      case SupabaseRequestSuccess():
        state = const AsyncData<void>(null);
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
