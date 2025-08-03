import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart' show XFile;

import '../../../../core/models/project.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../data_source/portfolio_remote_data_source.dart';
import '../models/update_project_img_params.dart';
import 'portfolio_repo_impl.dart';

final portfolioRepoProvider = Provider.autoDispose<PortfolioRepo>((ref) {
  final remoteDataSource = ref.read(portfolioRemoteDataSourceProvider);
  return PortfolioRepoImpl(remoteDataSource);
});

abstract class PortfolioRepo {
  Future<SupabaseRequestResult<List<Project>>> fetchPortfolio(Ref ref);

  Future<SupabaseRequestResult<void>> updateProject(Ref ref, Project project);

  Future<SupabaseRequestResult<void>> showOrHideProjectFromAbout(
    Ref ref,
    String projectId,
  );

  Future<SupabaseRequestResult<String>> updateProjectImg(
    Ref ref,
    UpdateProjectImgParams params,
  );

  Future<SupabaseRequestResult<String>> uploadImgToSupabase(
    Ref ref,
    XFile pickedImgFile, {
    String? imgPath,
  });

  Future<SupabaseRequestResult<void>> addProject(Ref ref, Project project);

  Future<SupabaseRequestResult<void>> deleteProject(Ref ref, String projectId);
}
