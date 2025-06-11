import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;

import '../../provider/layout_provider.dart' show layoutActiveTabProvider;

class FAPConsumerButton extends ConsumerWidget {
  const FAPConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeIndex = ref.watch(layoutActiveTabProvider);
    return activeIndex == 2
        ? FloatingActionButton(
          onPressed: () {},
          child: const Icon(LucideIcons.badgePlus400, color: Colors.white),
        )
        : const SizedBox.shrink();
  }
}
