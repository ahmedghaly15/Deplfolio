import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;
import 'package:image_picker/image_picker.dart' show XFile;

import '../../../../core/data_source/shared_remote_data_source.dart';
import '../../../../core/models/project.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../models/update_project_img_params.dart';
import 'portfolio_remote_data_source_impl.dart';

final portfolioRemoteDataSourceProvider =
    Provider.autoDispose<PortfolioRemoteDataSource>((ref) {
      final remoteDataSource = ref.read(sharedRemoteDataSourceProvider);
      final supabaseClient = ref.read(supabaseProvider);
      return PortfolioRemoteDataSourceImpl(remoteDataSource, supabaseClient);
    });

abstract class PortfolioRemoteDataSource {
  Future<List<Project>> fetchPortfolio();

  Future<void> updateProject(Project project);

  Future<void> showOrHideProjectFromAbout(String projectId);

  Future<String> updateProjectImg(UpdateProjectImgParams params);

  Future<String> uploadImgToSupabase(XFile pickedImgFile, {String? imgPath});

  Future<void> addProject(Project project);

  Future<void> deleteProject(String projectId);
}
