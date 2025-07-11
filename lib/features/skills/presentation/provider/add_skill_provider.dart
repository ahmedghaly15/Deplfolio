// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency

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
GlobalKey<ShadFormState> addSkillFormKey(Ref ref) => GlobalKey<ShadFormState>();

final addSKillNameProvider = StateProvider.autoDispose<String>((ref) => '');
final addSkillPercentProvider = StateProvider.autoDispose<double>((ref) => 0.0);

@riverpod
class AddSkill extends _$AddSkill {
  @override
  AsyncValue<void>? build() => null;

  void _add() async {
    final skillName = ref.read(addSKillNameProvider);
    final skillPercent = ref.read(addSkillPercentProvider);
    state = const AsyncValue.loading();
    final result = await ref
        .read(skillsRepoProvider)
        .addSkill(
          ref,
          SkillModel(
            id: generateRandomId(),
            name: skillName,
            percent: skillPercent,
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
