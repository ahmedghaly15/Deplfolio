import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/portfolio_repo.dart';

part 'delete_project_provider.g.dart';

@riverpod
class DeleteProject extends _$DeleteProject {
  @override
  AsyncValue<void>? build() => null;

  void execute(String projectId) async {
    state = const AsyncValue.loading();
    final result = await ref
        .read(portfolioRepoProvider)
        .deleteProject(ref, projectId);
    result.when(
      success: (_) => state = const AsyncValue.data(null),
      failure:
          (errorModel) =>
              state = AsyncValue.error(errorModel.message, StackTrace.current),
    );
  }
}
