import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart'
    show atomOneDarkTheme;

import 'code_field_consumer.dart';
import 'widgets/read_code_file_button_consumer.dart';
import 'widgets/save_code_file_button_consumer.dart';

class CodeEditorView extends StatelessWidget {
  const CodeEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return CodeTheme(
      data: CodeThemeData(styles: atomOneDarkTheme),
      child: const CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              ReadCodeFileButtonConsumer(),
              SaveCodeFileButtonConsumer(),
            ],
          ),
          SliverFillRemaining(hasScrollBody: false, child: CodeFieldConsumer()),
        ],
      ),
    );
  }
}
