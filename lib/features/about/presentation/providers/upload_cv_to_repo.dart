import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/api/api_request_result.dart';
import '../../data/repository/about_repo.dart';

part 'upload_cv_to_repo.g.dart';

class PickFileNotifier extends StateNotifier<FilePickerResult?> {
  PickFileNotifier() : super(null);

  void pickFile() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    state = pickedFile;
  }
}

final pickFileProvider =
    StateNotifierProvider<PickFileNotifier, FilePickerResult?>(
      (ref) => PickFileNotifier(),
    );

@riverpod
class UploadCvToRepo extends _$UploadCvToRepo {
  @override
  AsyncValue<void>? build() => null;

  void upload() async {
    state = const AsyncLoading();
    final pickedFile = ref.read(pickFileProvider);

    if (pickedFile == null) return;

    final result = await ref.read(aboutRepoProvider).uploadCvToRepo(pickedFile);
    switch (result) {
      case ApiRequestSuccess():
        state = const AsyncData(null);
      case ApiRequestFailure(:final errorModel):
        state = AsyncError(errorModel.message, StackTrace.current);
    }
  }
}
