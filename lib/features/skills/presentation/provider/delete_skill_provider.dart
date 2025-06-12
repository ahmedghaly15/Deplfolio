import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/repository/skills_repo.dart';

part 'delete_skill_provider.g.dart';

@riverpod
class DeleteSkill extends _$DeleteSkill {
  @override
  AsyncValue<void>? build() => null;

  void delete(String skillId) async {
    state = const AsyncValue.loading();
    final result = await ref.read(skillsRepoProvider).deleteSkill(ref, skillId);
    switch (result) {
      case SupabaseRequestSuccess():
        state = const AsyncValue.data(null);
      case SupabaseRequestFailure(:final errorModel):
        state = AsyncValue.error(errorModel.message, StackTrace.current);
    }
  }
}
