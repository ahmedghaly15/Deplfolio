// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:io' show File;

import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/providers/pick_file_provider.dart';

part 'read_picked_code_file_provider.g.dart';

@riverpod
class ReadPickedCodeFile extends _$ReadPickedCodeFile {
  @override
  AsyncValue<String?>? build() => null;

  void execute() async {
    await Permission.storage.request();
    state = const AsyncLoading();
    try {
      final pickedFileContent = await _readPickedCodeFileContent();
      state = AsyncData(pickedFileContent);
    } catch (e) {
      state = AsyncError(e.toString(), StackTrace.current);
    }
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
