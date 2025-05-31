import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/layout_provider.dart';

class LayoutViewBodyConsumer extends ConsumerWidget {
  const LayoutViewBodyConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(layoutActiveWidgetProvider);
  }
}
