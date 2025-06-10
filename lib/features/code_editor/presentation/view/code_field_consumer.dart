import 'package:flutter_code_editor/flutter_code_editor.dart' show CodeField;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../providers/code_editor_providers.dart';

class CodeFieldConsumer extends ConsumerWidget {
  const CodeFieldConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codeController = ref.watch(codeEditorControllerProvider);
    return CodeField(controller: codeController, expands: true);
  }
}
