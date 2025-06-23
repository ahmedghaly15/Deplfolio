import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadCheckbox;

import '../../../../../core/models/project.dart' show Project;
import '../../../../../core/utils/app_strings.dart';
import '../../providers/show_or_hide_project_from_about_provider.dart';

class ShowProjectInAboutCheckboxConsumer extends ConsumerWidget {
  const ShowProjectInAboutCheckboxConsumer({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShown = ref.watch(toggleShowingProjectInAboutProvider(project.id));
    _showOrHideProjectFromAboutProviderListener(ref, context);
    return ShadCheckbox(
      value: isShown,
      onChanged: (value) => _showOrHideProjectFromAbout(ref),
      label: Text(project.title, overflow: TextOverflow.ellipsis, maxLines: 1),
    );
  }

  void _showOrHideProjectFromAboutProviderListener(
    WidgetRef ref,
    BuildContext context,
  ) {
    ref.listen(showOrHideProjectFromAboutProvider, (_, current) {
      current?.whenOrNull(
        data: (_) => _onShowOrHideSuccess(ref, context),
        error: (error, _) => context.showToast(error.toString()),
      );
    });
  }

  void _onShowOrHideSuccess(WidgetRef ref, BuildContext context) {
    final shownInAbout = ref.read(
      toggleShowingProjectInAboutProvider(project.id),
    );
    switch (shownInAbout) {
      case true:
        context.showToast(AppStrings.projectIsShownInAbout);
        break;
      case false:
        context.showToast(AppStrings.projectIsHiddenFromAbout);
        break;
    }
  }

  void _showOrHideProjectFromAbout(WidgetRef ref) {
    final previousState = ref.read(
      toggleShowingProjectInAboutProvider(project.id),
    );
    ref.read(toggleShowingProjectInAboutProvider(project.id).notifier).toggle();
    ref
        .read(showOrHideProjectFromAboutProvider.notifier)
        .execute(
          project.id,
          onError: () {
            ref
                .read(toggleShowingProjectInAboutProvider(project.id).notifier)
                .setValue(previousState);
          },
        );
  }
}
