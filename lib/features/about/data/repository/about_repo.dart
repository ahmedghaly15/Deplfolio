import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_request_result.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/const_strings.dart';
import '../../../../core/utils/functions/api_execute_and_handle_errors.dart';
import '../../../../core/utils/functions/supabase_execute_and_handle_errors.dart';
import '../api/about_api_service.dart';
import '../data_source.dart/about_remote_data_source.dart';
import '../models/about.dart';
import '../models/introduction_section.dart';
import '../models/upload_cv_request_body.dart';

final aboutRepoProvider = Provider.autoDispose<AboutRepo>((ref) {
  final remoteDataSource = ref.read(aboutRemoteDataSourceProvider);
  final apiService = ref.read(aboutApiServiceProvider);
  return AboutRepo(remoteDataSource, apiService);
});

class AboutRepo {
  final AboutRemoteDataSource _remoteDataSource;
  final AboutApiService _apiService;

  AboutRepo(this._remoteDataSource, this._apiService);

  Future<SupabaseRequestResult<About>> fetchAbout(Ref ref) {
    return supabaseExecuteAndHandleErrors(
      ref,
      () async => await _remoteDataSource.fetchAbout(),
    );
  }

  Future<SupabaseRequestResult<void>> updateIntroductionSection(
    Ref ref,
    IntroductionSection params,
  ) {
    return supabaseExecuteAndHandleErrors(
      ref,
      () async => await _remoteDataSource.updateIntroductionSection(params),
    );
  }

  Future<String?> _checkForGithubFileExistence() async {
    final saferFilePathUrl = Uri.encodeComponent(ConstStrings.remoteCVPath);
    final response = await _apiService.checkForGithubFileExistence(
      saferFilePathUrl,
    );
    return response.sha;
  }

  Future<ApiRequestResult<void>> uploadCvToRepo(
    FilePickerResult pickedFile, {
    String? sha,
  }) {
    final saferFilePathUrl = Uri.encodeComponent(ConstStrings.remoteCVPath);
    final filePath = pickedFile.files.single.path!;
    final fileBytes = File(filePath).readAsBytesSync();
    final encodedContent = base64Encode(fileBytes);
    return apiExecuteAndHandleErrors<void>(() async {
      final sha = await _checkForGithubFileExistence();
      await _apiService.uploadCvToRepo(
        saferFilePathUrl,
        UploadCvRequestBody(fileEncodedContent: encodedContent, sha: sha),
      );
    });
  }
}
