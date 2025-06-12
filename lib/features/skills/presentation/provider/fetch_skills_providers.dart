import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/models/fetch_skills.dart';
import '../../data/repository/skills_repo.dart';

final fetchSkillsProvider = FutureProvider.autoDispose<FetchSkills>((
  ref,
) async {
  final skillsRepo = ref.read(skillsRepoProvider);
  final result = await skillsRepo.fetchSkills(ref);
  switch (result) {
    case SupabaseRequestSuccess(:final data):
      return data;
    case SupabaseRequestFailure(:final errorModel):
      throw errorModel.message;
  }
});
