import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart'
    show atomOneDarkTheme;

import 'code_field_consumer.dart';

class CodeEditorView extends StatelessWidget {
  const CodeEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return CodeTheme(
      data: CodeThemeData(styles: atomOneDarkTheme),
      child: const SingleChildScrollView(child: CodeFieldConsumer()),
    );
  }
}
