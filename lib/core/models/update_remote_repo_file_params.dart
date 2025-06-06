import 'package:file_picker/file_picker.dart';

class UpdateRemoteRepoFileParams {
  final FilePickerResult pickedFile;
  final String remoteFilePath;

  const UpdateRemoteRepoFileParams({
    required this.pickedFile,
    required this.remoteFilePath,
  });
}
