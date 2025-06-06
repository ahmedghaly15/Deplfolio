import 'dart:io' show File;

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import 'code_editor_providers.dart' show codeEditorControllerProvider;
import 'pick_code_file_provider.dart';

part 'save_code_file_provider.g.dart';

@riverpod
class SaveCodeFile extends _$SaveCodeFile {
  @override
  AsyncValue<void>? build() => null;

  void execute() async {
    state = const AsyncLoading();
    try {
      if (ref.watch(codeEditorControllerProvider).text.isNullOrEmpty) return;
      await _save();
      state = const AsyncData(null);
    } catch (e) {
      state = AsyncError(e.toString(), StackTrace.current);
    }
  }

  Future<void> _save() async {
    final content = ref.watch(codeEditorControllerProvider).text;
    final pickedFilePath = ref.read(pickCodeFilePathProvider);
    final file = File(pickedFilePath!);
    await file.writeAsString(content);
  }
}
