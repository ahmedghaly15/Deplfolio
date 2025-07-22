import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/portfolio_repo.dart';

final deleteProjectProvider = FutureProvider.family.autoDispose<void, String>((
  ref,
  projectId,
) async {
  final result = await ref
      .read(portfolioRepoProvider)
      .deleteProject(ref, projectId);
  result.whenOrNull(failure: (error) => throw error.message);
});
