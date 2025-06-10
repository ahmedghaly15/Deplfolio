import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../providers/code_editor_providers.dart';
import '../../providers/read_picked_code_file_provider.dart';

class ReadCodeFileButtonConsumer extends ConsumerWidget {
  const ReadCodeFileButtonConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listener(ref, context);
    return IconButton(
      onPressed: () {
        ref.read(readPickedCodeFileProvider.notifier).execute();
      },
      icon: const Icon(LucideIcons.fileText400),
    );
  }

  void _listener(WidgetRef ref, BuildContext context) {
    ref.listen(readPickedCodeFileProvider, (_, current) {
      current?.whenOrNull(
        data: (pickedCodeFileContent) {
          if (!pickedCodeFileContent.isNullOrEmpty) {
            ref.read(codeEditorControllerProvider).text =
                pickedCodeFileContent!;
          }
        },
        error: (error, _) => context.showToast(error.toString()),
      );
    });
  }
}
