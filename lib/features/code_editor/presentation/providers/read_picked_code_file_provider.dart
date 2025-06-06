import 'dart:io' show File;

import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/providers/pick_file_provider.dart';

part 'read_picked_code_file_provider.g.dart';

@riverpod
class ReadPickedCodeFile extends _$ReadPickedCodeFile {
  @override
  AsyncValue<String?> build() => const AsyncValue.data(null);

  void execute() async {
    state = const AsyncLoading();
    try {
      final pickedFileContent = await _requestPermissionAndReadCodeFile();
      state = AsyncData(pickedFileContent);
    } catch (e) {
      state = AsyncError(e.toString(), StackTrace.current);
    }
  }

  Future<String?> _requestPermissionAndReadCodeFile() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      return await _readPickedCodeFileContent();
    } else if (status.isDenied) {
      await Permission.storage.request();
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    }

    return null;
  }

  Future<String?> _readPickedCodeFileContent() async {
    final pickedFile = await ref.read(pickFileProvider.notifier).pickFile([
      'dart',
      'txt',
    ]);
    final pickedFilePath = pickedFile?.files.single.path;
    if (pickedFilePath != null) {
      final file = File(pickedFilePath);
      return await file.readAsString();
    } else {
      return null;
    }
  }
}
