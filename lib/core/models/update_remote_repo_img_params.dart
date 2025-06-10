import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart' show XFile;

part 'update_remote_repo_img_params.freezed.dart';

@Freezed(fromJson: false, toJson: false)
abstract class UpdateRemoteRepoImgParams with _$UpdateRemoteRepoImgParams {
  const factory UpdateRemoteRepoImgParams({
    required String projectTitle,
    XFile? pickedFile,
  }) = _UpdateRemoteRepoImgParams;
}
