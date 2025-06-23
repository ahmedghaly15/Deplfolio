import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/project.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/repository/portfolio_repo.dart';

final portfolioProjectsProvider = StateProvider.autoDispose<List<Project>>((
  ref,
) {
  final link = ref.keepAlive();
  // Dispose when the last listener is gone
  ref.onCancel(() {
    link.close(); // Allow disposal
  });
  return [];
});

final fetchPortfolioProvider = FutureProvider.autoDispose<List<Project>>((
  ref,
) async {
  final portfolioRepo = ref.read(portfolioRepoProvider);
  final result = await portfolioRepo.fetchPortfolio(ref);
  switch (result) {
    case SupabaseRequestSuccess(:final data):
      return data;
    case SupabaseRequestFailure(:final errorModel):
      throw errorModel.message;
  }
});
