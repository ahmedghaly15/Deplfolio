import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/repository/portfolio_repo.dart';

part 'show_or_hide_project_from_about_provider.g.dart';

@riverpod
class ShowOrHideProjectFromAbout extends _$ShowOrHideProjectFromAbout {
  @override
  AsyncValue<void>? build() => null;

  void execute(String projectTitle) async {
    state = const AsyncLoading();
    final result = await ref
        .read(portfolioRepoProvider)
        .showOrHideProjectFromAbout(ref, projectTitle);
    switch (result) {
      case SupabaseRequestSuccess():
        state = const AsyncData(null);
      case SupabaseRequestFailure(:final errorModel):
        state = AsyncError(errorModel.message, StackTrace.current);
    }
  }
}
