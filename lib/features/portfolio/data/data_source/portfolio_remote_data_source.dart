import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart' show XFile;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/data_source/remote_data_source.dart';
import '../../../../core/models/project.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/const_strings.dart';
import '../models/update_project_img_params.dart';

final portfolioRemoteDataSourceProvider =
    Provider.autoDispose<PortfolioRemoteDataSource>((ref) {
      final remoteDataSource = ref.read(remoteDataSourceProvider);
      final supabaseClient = ref.read(supabaseProvider);
      return PortfolioRemoteDataSource(remoteDataSource, supabaseClient);
    });

class PortfolioRemoteDataSource {
  final RemoteDataSource _remoteDataSource;
  final SupabaseClient _supabaseClient;

  PortfolioRemoteDataSource(this._remoteDataSource, this._supabaseClient);

  Future<List<Project>> fetchPortfolio() async {
    final remoteJson = await _remoteDataSource.fetchRemotePortfolioJson();
    final projectsJson = remoteJson['portfolio'] as List<dynamic>;
    return projectsJson
        .map((projectJson) => Project.fromJson(projectJson))
        .toList();
  }

  Future<void> updateProject(Project project) async {
    final remoteJson = await _remoteDataSource.fetchRemotePortfolioJson();
    final projectsJson = remoteJson['portfolio'] as List<dynamic>;
    final projectIndex = projectsJson.indexWhere((p) => p['id'] == project.id);
    projectsJson[projectIndex] = project.toJson();
    Map<String, dynamic> aboutJson = remoteJson['about'];
    aboutJson = {
      ...aboutJson,
      ...{'projects': projectsJson},
    };
    // Because They don't depend on each other, Run both updates concurrently
    await Future.wait([
      _updateProjectInPortfolio(projectsJson),
      _updateProjectInAbout(aboutJson),
    ]);
  }

  Future<void> _updateProjectInAbout(Map<String, dynamic> aboutJson) async {
    await _supabaseClient
        .from(ConstStrings.dataTable)
        .update({'about': aboutJson})
        .eq(ConstStrings.tableEqualityKey, AppUtils.userId!);
  }

  Future<void> _updateProjectInPortfolio(List<dynamic> projectsJson) async {
    await _supabaseClient
        .from(ConstStrings.dataTable)
        .update({'portfolio': projectsJson})
        .eq(ConstStrings.tableEqualityKey, AppUtils.userId!);
  }

  Future<void> showOrHideProjectFromAbout(String projectTitle) async {
    final remoteJson = await _remoteDataSource.fetchRemotePortfolioJson();
    final projectsJson = remoteJson['portfolio'] as List<dynamic>;
    final projectIndex = projectsJson.indexWhere(
      (p) => p['title'] == projectTitle,
    );
    final shownInAbout = projectsJson[projectIndex]['shownInAbout'] as bool;
    projectsJson[projectIndex]['shownInAbout'] = !shownInAbout;
    await _supabaseClient
        .from(ConstStrings.dataTable)
        .update({'portfolio': projectsJson})
        .eq(ConstStrings.tableEqualityKey, AppUtils.userId!);
  }

  Future<String> updateProjectImg(UpdateProjectImgParams params) async {
    final existingPath = '${(params.projectTitle).toLowerCase()}_icon.png';
    final fileBytes = await params.pickedImgFile.readAsBytes();
    await _uploadToBucket(existingPath, fileBytes);
    return await _createSignedUrl(existingPath);
  }

  Future<String> uploadImgToSupabase(XFile pickedImgFile) async {
    final storageFilePath = pickedImgFile.path;
    final fileBytes = await pickedImgFile.readAsBytes();
    await _uploadToBucket(storageFilePath, fileBytes);
    return await _createSignedUrl(storageFilePath);
  }

  Future<String> _createSignedUrl(String imgPath) async {
    return await _supabaseClient.storage
        .from(ConstStrings.dataStorage)
        .createSignedUrl('images/$imgPath', 60 * 60 * 360 * 60);
  }

  Future<String> _uploadToBucket(String imgPath, Uint8List fileBytes) async {
    return await _supabaseClient.storage
        .from(ConstStrings.dataStorage)
        .uploadBinary('images/$imgPath', fileBytes);
  }
}
