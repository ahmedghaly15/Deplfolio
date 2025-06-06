import 'dart:io' show File;

import 'package:file_picker/file_picker.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart'
    show CodeController;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/languages/dart.dart';

final codeEditorControllerProvider = Provider.autoDispose<CodeController>(
  (ref) => CodeController(language: dart),
);

final pickCodeFileProvider = FutureProvider.autoDispose<String?>((ref) async {
  try {
    return await _pickCodeFile();
  } catch (e) {
    throw e.toString();
  }
});

Future<String?> _pickCodeFile() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['dart', 'txt'],
  );

  final filePath = result?.files.single.path;

  if (result != null && filePath != null) {
    final file = File(filePath);
    return await file.readAsString();
  } else {
    return null;
  }
}
