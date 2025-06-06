import 'package:image_picker/image_picker.dart' show XFile;

class UpdateProjectImgParams {
  final String projectTitle;
  final XFile pickedImgFile;

  UpdateProjectImgParams({
    required this.projectTitle,
    required this.pickedImgFile,
  });
}
