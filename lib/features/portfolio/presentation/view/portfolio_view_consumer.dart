import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../core/widgets/adaptive_refresh_indicator.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../about/presentation/view/widgets/project_item.dart';
import '../provider/portfolio_providers.dart';

class PortfolioViewConsumer extends ConsumerWidget {
  const PortfolioViewConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPortfolio = ref.watch(fetchPortfolioProvider);
    return asyncPortfolio.when(
      data:
          (projects) => AdaptiveRefreshIndicator(
            onRefresh: () => ref.refresh(fetchPortfolioProvider.future),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: AppUtils.screenPadding,
              itemBuilder:
                  (_, index) =>
                      ElasticIn(child: ProjectItem(project: projects[index])),
              separatorBuilder: (_, __) => SizedBox(height: 24.h),
              itemCount: projects.length,
            ),
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
}
