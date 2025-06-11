import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/repository/about_repo.dart' show aboutRepoProvider;

part 'delete_approach_provider.g.dart';

@riverpod
class DeleteApproach extends _$DeleteApproach {
  @override
  AsyncValue<void>? build() => null;

  void execute(String approachId) async {
    state = const AsyncValue.loading();
    final result = await ref
        .read(aboutRepoProvider)
        .deleteApproach(ref, approachId);
    switch (result) {
      case SupabaseRequestSuccess():
        state = const AsyncValue.data(null);
      case SupabaseRequestFailure(:final errorModel):
        state = AsyncValue.error(errorModel.message, StackTrace.current);
    }
  }
}
