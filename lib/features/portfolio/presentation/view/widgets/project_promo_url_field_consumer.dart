import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/update_project_provider.dart'
    show projectPromoUrlProvider;

class ProjectPromoUrlFieldConsumer extends ConsumerWidget {
  const ProjectPromoUrlFieldConsumer({super.key, required this.promoUrl});

  final String? promoUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomDataInput(
      initialValue: promoUrl ?? '',
      labelText: AppStrings.promoUrl,
      onChanged: (value) {
        // comapring new value with old state stored in provider
        if (value != ref.read(projectPromoUrlProvider)) {
          ref.read(projectPromoUrlProvider.notifier).state = value;
        }
      },
    );
  }
}
