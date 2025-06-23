import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../core/widgets/adaptive_refresh_indicator.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import 'widgets/portfolio_view.dart';
import '../providers/fetch_portfolio_provider.dart';

class PortfolioViewConsumer extends ConsumerWidget {
  const PortfolioViewConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPortfolio = ref.watch(fetchPortfolioProvider);
    _fetchPortfolioProviderListener(ref);
    return asyncPortfolio.when(
      data:
          (projects) => AdaptiveRefreshIndicator(
            onRefresh: () => ref.refresh(fetchPortfolioProvider.future),
            child: PortfolioView(projects: projects),
          ),
      error:
          (error, _) => CustomErrorWidget(
            onPressed: () => ref.refresh(fetchPortfolioProvider.future),
            error: error.toString(),
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

  void _fetchPortfolioProviderListener(WidgetRef ref) {
    ref.listen(fetchPortfolioProvider, (_, current) {
      current.whenOrNull(
        data:
            (projects) =>
                ref.read(portfolioProjectsProvider.notifier).state = projects,
      );
    });
  }
}
