// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:typed_data' show Uint8List;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:file_saver/file_saver.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import 'code_editor_providers.dart' show codeEditorControllerProvider;
import '../../../../core/providers/pick_file_provider.dart';

part 'save_code_file_provider.g.dart';

@riverpod
class SaveCodeFile extends _$SaveCodeFile {
  @override
  AsyncValue<String>? build() => null;

  void execute() async {
    final pickedFile = ref.read(pickFileProvider);
    final content = ref.read(codeEditorControllerProvider).text;
    if (content.isNullOrEmpty ||
        pickedFile == null ||
        pickedFile.files.isEmpty) {
      return;
    } else {
      state = const AsyncLoading();
      try {
        await _save(content);
        state = AsyncData(content);
      } catch (e) {
        state = AsyncError(e.toString(), StackTrace.current);
      }
    }
  }

  Future<void> _save(String content) async {
    final bytes = Uint8List.fromList(content.codeUnits);
    await FileSaver.instance.saveFile(
      name: 'assets',
      bytes: bytes,
      ext: 'dart',
    );
  }
}
