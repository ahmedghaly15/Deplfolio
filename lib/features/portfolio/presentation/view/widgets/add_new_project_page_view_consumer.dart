import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../providers/add_new_project_page_view_providers.dart';
import 'add_new_project_continue_consumer_button.dart';
import 'add_new_project_smooth_indicators_consumer.dart';

class AddNewProjectPageViewConsumer extends ConsumerWidget {
  const AddNewProjectPageViewConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageViews = ref.read(addNewProjectPageViewItems);
    final pageIndex = ref.watch(onChangeAddNewProjectPageViewProvider);
    final size = MediaQuery.sizeOf(context);
    return Column(
      spacing: 24.h,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: _pageViewSize(size, pageIndex),
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: pageViews.length,
            controller: ref.read(addNewProjectPageControllerProvider),
            itemBuilder: (_, index) => pageViews[index],
          ),
        ),
        const AddNewProjectSmoothIndicatorsConsumer(),
        const AddNewProjectContinueConsumerButton(),
      ],
    );
  }

  double _pageViewSize(Size size, int pageIndex) {
    switch (pageIndex) {
      case 0:
        return size.height * 0.2;
      default:
        return size.height * 0.5;
    }
  }
}
