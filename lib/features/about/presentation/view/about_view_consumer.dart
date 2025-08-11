import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/local_data_source/local_data_refresher.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../core/widgets/adaptive_refresh_indicator.dart';
import '../../../../core/widgets/custom_error_widget.dart';

import '../providers/fetch_about_provider.dart';
import 'widgets/about_view.dart';

class AboutViewConsumer extends ConsumerWidget {
  const AboutViewConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAbout = ref.watch(fetchAboutProvider);
    // _fetchAboutProviderListener(ref, context);
    return asyncAbout.when(
      skipError: true,
      skipLoadingOnRefresh: true,
      data:
          (about) => AdaptiveRefreshIndicator(
            onRefresh:
                () async => await LocalDataRefresher.refreshAboutProvider(ref),
            child: AboutView(about: about!),
          ),
      error:
          (error, _) => CustomErrorWidget(
            error: error.toString(),
            onRetry: () => ref.invalidate(fetchAboutProvider),
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

  // void _fetchAboutProviderListener(WidgetRef ref, BuildContext context) {
  //   ref.listen(fetchAboutProvider, (_, current) {
  //     current.whenOrNull(
  //       error: (error, _) => context.showToast(error.toString()),
  //     );
  //   });
  // }
}
