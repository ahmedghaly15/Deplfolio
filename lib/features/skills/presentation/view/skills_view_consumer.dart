import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../core/widgets/adaptive_refresh_indicator.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../provider/fetch_skills_providers.dart';
import 'widgets/skills_view.dart';

class SkillsViewConsumer extends ConsumerWidget {
  const SkillsViewConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSkills = ref.watch(fetchSkillsProvider);
    return asyncSkills.when(
      data:
          (skills) => AdaptiveRefreshIndicator(
            onRefresh: () => ref.refresh(fetchSkillsProvider.future),
            child: SkillsView(skills: skills),
          ),
      error:
          (error, __) => CustomErrorWidget(
            error: error.toString(),
            onPressed: () => ref.refresh(fetchSkillsProvider.future),
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
