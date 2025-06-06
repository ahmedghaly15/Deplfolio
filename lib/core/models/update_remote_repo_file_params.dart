import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_remote_repo_file_params.freezed.dart';

@Freezed(fromJson: false, toJson: false)
abstract class UpdateRemoteRepoFileParams with _$UpdateRemoteRepoFileParams {
  const factory UpdateRemoteRepoFileParams({
    required List<String> pickedFileAllowedExtensions,
    FilePickerResult? pickedFile,
    String? remoteFilePath,
    String? commitMessage,
  }) = _UpdateRemoteRepoFileParams;
}
