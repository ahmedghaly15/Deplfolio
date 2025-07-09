// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/api/api_request_result.dart';
import '../../../../core/models/update_remote_repo_img_params.dart';
import '../../../../core/repositories/github_repo.dart';
import 'image_picker_providers.dart' show imagePickerNotifierProvider;

part 'upload_img_to_github_provider.g.dart';

@riverpod
class UploadImgToGithub extends _$UploadImgToGithub {
  @override
  AsyncValue<void>? build() => null;

  Future<void> execute(String projectTitle) async {
    final pickedImg = ref.read(imagePickerNotifierProvider);
    if (pickedImg == null) return;
    state = const AsyncValue.loading();
    final result = await ref
        .read(githubRepoProvider)
        .updateRemoteRepoImg(
          UpdateRemoteRepoImgParams(
            projectTitle: projectTitle,
            pickedFile: pickedImg,
          ),
        );
    switch (result) {
      case ApiRequestSuccess():
        state = const AsyncValue.data(null);
      case ApiRequestFailure(:final errorModel):
        state = AsyncValue.error(errorModel.message, StackTrace.current);
    }
  }
}
