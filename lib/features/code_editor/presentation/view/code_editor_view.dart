import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart'
    show atomOneDarkTheme;
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;

import 'code_field_consumer.dart';

class CodeEditorView extends StatelessWidget {
  const CodeEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return CodeTheme(
      data: CodeThemeData(styles: atomOneDarkTheme),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(LucideIcons.fileText400),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(LucideIcons.save400),
              ),
            ],
          ),
          const SliverFillRemaining(
            hasScrollBody: false,
            child: CodeFieldConsumer(),
          ),
        ],
      ),
    );
  }
}
