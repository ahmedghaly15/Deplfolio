import 'dart:developer' show log;

import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart' show XFile;

import '../../../../core/models/project.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/supabase_execute_and_handle_errors.dart';
import '../data_source/local_data_source/project_dao.dart'
    show projectDaoProvider;
import '../data_source/portfolio_remote_data_source.dart';
import '../models/update_project_img_params.dart';

final portfolioRepoProvider = Provider.autoDispose<PortfolioRepo>((ref) {
  final remoteDataSource = ref.read(portfolioRemoteDataSourceProvider);
  return PortfolioRepo(remoteDataSource);
});

class PortfolioRepo {
  final PortfolioRemoteDataSource _remoteDataSource;

  PortfolioRepo(this._remoteDataSource);

  Future<SupabaseRequestResult<List<Project>>> fetchPortfolio(Ref ref) async {
    final projectDao = await ref.read(projectDaoProvider.future);
    final cachedProjectsEntity = await projectDao.fetchProjects();
    final cachedProjects = cachedProjectsEntity?.toProjectModelList();
    if (cachedProjects != null) {
      log('FETCHED CACHED PROJECTS FROM LOCAL DB');
      return SupabaseRequestResult.success(cachedProjects);
    } else {
      return supabaseExecuteAndHandleErrors<List<Project>>(ref, () async {
        final remoteProjects = await _remoteDataSource.fetchPortfolio();
        await projectDao.insertProjects(remoteProjects.toProjectEntityList());
        log('FETCHED PORTFOLIO FROM REMOTE SOURCE AND SAVED TO LOCAL DB');
        return remoteProjects;
      });
    }
  }

  Future<SupabaseRequestResult<void>> updateProject(Ref ref, Project project) {
    return supabaseExecuteAndHandleErrors<void>(
      ref,
      () async => await _remoteDataSource.updateProject(project),
    );
  }

  Future<SupabaseRequestResult<void>> showOrHideProjectFromAbout(
    Ref ref,
    String projectId,
  ) {
    return supabaseExecuteAndHandleErrors<void>(
      ref,
      () async => await _remoteDataSource.showOrHideProjectFromAbout(projectId),
    );
  }

  Future<SupabaseRequestResult<String>> updateProjectImg(
    Ref ref,
    UpdateProjectImgParams params,
  ) {
    return supabaseExecuteAndHandleErrors<String>(
      ref,
      () async => await _remoteDataSource.updateProjectImg(params),
    );
  }

  Future<SupabaseRequestResult<String>> uploadImgToSupabase(
    Ref ref,
    XFile pickedImgFile,
  ) {
    return supabaseExecuteAndHandleErrors<String>(
      ref,
      () async => await _remoteDataSource.uploadImgToSupabase(pickedImgFile),
    );
  }
}
