import 'package:flutter_code_editor/flutter_code_editor.dart'
    show CodeController;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/languages/dart.dart';

final codeEditorControllerProvider = Provider.autoDispose<CodeController>(
  (ref) => CodeController(language: dart),
);
