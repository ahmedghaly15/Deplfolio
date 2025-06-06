import 'dart:io' show File;

import 'package:flutter_code_editor/flutter_code_editor.dart'
    show CodeController;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/languages/dart.dart';
import 'package:permission_handler/permission_handler.dart';

import 'pick_code_file_provider.dart';

final codeEditorControllerProvider = Provider.autoDispose<CodeController>(
  (ref) => CodeController(language: dart),
);

final pickedFileContentProvider = FutureProvider.autoDispose<String?>((
  ref,
) async {
  final status = await Permission.storage.request();

  if (status.isGranted) {
    final pickedFilePath = ref.read(pickCodeFilePathProvider);
    return await _readPickedFileContent(pickedFilePath);
  } else if (status.isDenied) {
    await Permission.storage.request();
  } else if (status.isPermanentlyDenied) {
    await openAppSettings();
  }

  return null;
});

Future<String?> _readPickedFileContent(String? pickedFilePath) async {
  if (pickedFilePath != null) {
    final file = File(pickedFilePath);
    return await file.readAsString();
  } else {
    return null;
  }
}
