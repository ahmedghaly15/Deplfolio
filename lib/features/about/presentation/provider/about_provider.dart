import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/repository/about_repo.dart';

final fetchAboutProvider = FutureProvider.autoDispose<SupabaseRequestResult>((
  ref,
) {
  final aboutRepo = ref.watch(aboutRepoProvider);
  return aboutRepo.fetchAbout(ref);
});
