import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PickFileNotifier extends StateNotifier<FilePickerResult?> {
  PickFileNotifier() : super(null);

  Future<FilePickerResult?> pickFile() async {
    final pickedFile = await FilePicker.platform.pickFiles(type: FileType.any);
    state = pickedFile;
    return pickedFile;
  }
}

final pickFileProvider =
    StateNotifierProvider<PickFileNotifier, FilePickerResult?>(
      (ref) => PickFileNotifier(),
    );
