import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../provider/about_provider.dart';
import 'widgets/about_view.dart';

class AboutViewConsumer extends ConsumerWidget {
  const AboutViewConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAbout = ref.watch(fetchAboutProvider);
    return asyncAbout.when(
      data: (about) => AboutView(about: about!),
      error:
          (error, _) => CustomErrorWidget(
            error: error.toString(),
            onPressed: () => ref.refresh(fetchAboutProvider.future),
          ),
      loading:
          () => const Center(
            child: AdaptiveCircularProgressIndicator(
              dimension: 32,
              color: ColorManager.primaryColor,
            ),
          ),
    );
  }
}
