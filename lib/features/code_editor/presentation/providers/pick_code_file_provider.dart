import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PickCodeFilePathNotifier extends StateNotifier<String?> {
  PickCodeFilePathNotifier() : super(null);

  Future<String?> pickCodeFilePath() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['dart', 'txt'],
    );
    state = result?.files.single.path;
    return state;
  }
}

final pickCodeFilePathProvider =
    StateNotifierProvider<PickCodeFilePathNotifier, String?>(
      (ref) => PickCodeFilePathNotifier(),
    );
