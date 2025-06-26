import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../providers/save_code_file_provider.dart';

class SaveCodeFileButtonConsumer extends ConsumerWidget {
  const SaveCodeFileButtonConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listener(ref, context);
    return IconButton(
      onPressed: () => ref.read(saveCodeFileProvider.notifier).execute(),
      icon: const Icon(LucideIcons.save400),
    );
  }

  void _listener(WidgetRef ref, BuildContext context) {
    ref.listen(saveCodeFileProvider, (_, current) {
      current?.whenOrNull(
        data: (_) => context.showToast(AppStrings.fileSavedSuccessfully),
        error: (error, _) => context.showToast(error.toString()),
      );
    });
  }
}
