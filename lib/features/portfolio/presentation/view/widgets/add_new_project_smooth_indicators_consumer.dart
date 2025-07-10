import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/theming/color_manager.dart';
import '../../providers/add_new_project_page_view_providers.dart';

class AddNewProjectSmoothIndicatorsConsumer extends ConsumerWidget {
  const AddNewProjectSmoothIndicatorsConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(addNewProjectPageControllerProvider);
    final pageViewsLength = ref.read(addNewProjectPageViewItems).length;
    final size = MediaQuery.sizeOf(context);
    return SmoothPageIndicator(
      controller: pageController,
      count: pageViewsLength,
      effect: ColorTransitionEffect(
        dotColor: Colors.grey,
        activeDotColor: ColorManager.primaryColor,
        dotHeight: size.height * 0.008,
        dotWidth: size.width * 0.02,
        spacing: size.width * 0.015,
      ),
    );
  }
}
