import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;

import '../../../../core/supabase/supabase_request_result.dart';
import '../models/about.dart';
import '../models/introduction_section.dart';

abstract class AboutRepo {
  Future<SupabaseRequestResult<About>> fetchAbout(Ref ref);
  Future<SupabaseRequestResult<void>> updateIntroductionSection(
    Ref ref,
    IntroductionSection params,
  );
  Future<SupabaseRequestResult<void>> updateWorkExperience(
    Ref ref,
    WorkExperienceModel workExperience,
  );
  Future<SupabaseRequestResult<void>> updateApproach(
    Ref ref,
    ApproachModel approach,
  );
  Future<SupabaseRequestResult<void>> deleteApproach(
    Ref ref,
    String approachId,
  );
}
