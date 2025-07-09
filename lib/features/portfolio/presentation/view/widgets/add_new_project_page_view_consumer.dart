import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../providers/add_new_project_page_view_providers.dart';
import 'add_new_project_continue_consumer_button.dart';
import 'add_new_project_smooth_indicators_consumer.dart';

class AddNewProjectPageViewConsumer extends ConsumerWidget {
  const AddNewProjectPageViewConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageViews = ref.read(addNewProjectPageViewItems);
    return Column(
      spacing: 24.h,
      children: [
        Text(
          AppStrings.pickProjectImg,
          style: context.shadTextTheme.h4,
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: PageView.builder(
            controller: ref.read(addNewProjectPageControllerProvider),
            itemBuilder: (_, index) => pageViews[index],
            onPageChanged:
                (index) => ref
                    .read(onChangeAddNewProjectPageViewProvider.notifier)
                    .onChange(index),
          ),
        ),
        const AddNewProjectSmoothIndicatorsConsumer(),
        const AddNewProjectContinueConsumerButton(),
      ],
    );
  }
}
