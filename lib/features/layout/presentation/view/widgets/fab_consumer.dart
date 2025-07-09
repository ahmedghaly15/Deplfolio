import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;

import '../../../../../core/utils/app_strings.dart';
import '../../../../portfolio/presentation/view/widgets/add_new_project_page_view_consumer.dart';
import '../../../../skills/data/models/update_or_add_skill_form_params.dart';
import '../../../../skills/presentation/provider/add_skill_provider.dart';
import '../../../../skills/presentation/view/widgets/add_new_skill_consumer_button.dart';
import '../../../../skills/presentation/view/widgets/update_or_add_skill_form_consumer.dart';
import '../../provider/layout_provider.dart' show layoutActiveTabProvider;

class FABConsumer extends ConsumerWidget {
  const FABConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeIndex = ref.watch(layoutActiveTabProvider);
    return (activeIndex == 2 || activeIndex == 1)
        ? FloatingActionButton(
          onPressed:
              activeIndex == 1
                  ? () => context.showDialog(
                    titleText: AppStrings.addSkill,
                    // used ProviderScope so that every time, the widget is built
                    // the formKey is fresh and disposable at the same time
                    child: ProviderScope(
                      child: UpdateOrAddSkillFormConsumer(
                        params: UpdateOrAddSkillFormParams(
                          skillNameProvider: addSKillNameProvider,
                          skillPercentProvider: addSkillPercentProvider,
                          formKeyProvider: addSkillFormKeyProvider,
                        ),
                      ),
                    ),
                    actions: [const AddNewSkillConsumerButton()],
                  )
                  : () => context.showDialog(
                    titleText: AppStrings.addNewProject,
                    child: const ProviderScope(
                      child: AddNewProjectPageViewConsumer(),
                    ),
                  ),
          child: const Icon(LucideIcons.badgePlus400, color: Colors.white),
        )
        : const SizedBox.shrink();
  }
}
