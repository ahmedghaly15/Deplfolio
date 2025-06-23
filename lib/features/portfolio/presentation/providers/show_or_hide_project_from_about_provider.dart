// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/repository/portfolio_repo.dart';
import 'fetch_portfolio_provider.dart' show portfolioProjectsProvider;

part 'show_or_hide_project_from_about_provider.g.dart';

class ProjectShownInAboutNotifier extends StateNotifier<bool> {
  ProjectShownInAboutNotifier(super.initialShown);

  void toggle() => state = !state;
}

final toggleShowingProjectInAboutProvider = StateNotifierProvider.autoDispose
    .family<ProjectShownInAboutNotifier, bool, String>((ref, projectId) {
      final project = ref
          .watch(portfolioProjectsProvider)
          .firstWhere((project) => project.id == projectId);
      return ProjectShownInAboutNotifier(project.shownInAbout);
    });

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
