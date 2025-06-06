import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;

import '../../../../../core/utils/app_strings.dart';
import '../../providers/save_code_file_provider.dart';

class SaveCodeFileButtonConsumer extends ConsumerWidget {
  const SaveCodeFileButtonConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(saveCodeFileProvider, (_, currnet) {
      currnet?.whenOrNull(
        data: (_) => context.showToast(AppStrings.fileSavedSuccessfully),
        error: (error, _) => context.showToast(error.toString()),
      );
    });
    return IconButton(
      onPressed: () {
        ref.read(saveCodeFileProvider.notifier).execute();
      },
      icon: const Icon(LucideIcons.save400),
    );
  }
}
