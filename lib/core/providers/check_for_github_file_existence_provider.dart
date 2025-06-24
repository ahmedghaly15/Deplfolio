import 'package:flutter_riverpod/flutter_riverpod.dart' show FutureProvider;

import '../api/api_request_result.dart';
import '../repositories/github_repo.dart';

final checkForGithubFileExistenceProvider = FutureProvider.autoDispose
    .family<String?, String>((ref, saferFilePathUrl) async {
      final result = await ref
          .read(githubRepoProvider)
          .checkForGithubFileExistence(saferFilePathUrl);
      switch (result) {
        case ApiRequestSuccess(data: final data):
          return data.sha;
        case ApiRequestFailure(errorModel: final errorModel):
          if (errorModel.statusCode == 404 ||
              errorModel.message.contains('Not Found')) {
            return null; // File doesn't exist
          }
          throw errorModel.message;
      }
    });
