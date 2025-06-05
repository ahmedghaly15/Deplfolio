import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/app_utils.dart';
import '../../provider/layout_provider.dart';

class LayoutViewBodyConsumer extends ConsumerWidget {
  const LayoutViewBodyConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: AppUtils.screenPadding,
      child: ref.watch(layoutActiveWidgetProvider),
    );
  }
}
