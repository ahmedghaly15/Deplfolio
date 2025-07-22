import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadCheckbox;

import '../../../../../core/local_data_source/local_data_refresher.dart';
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
        data: (_) async {
          _showToast(ref, context);
          await Future.wait([
            LocalDataRefresher.refreshAboutProvider(ref),
            LocalDataRefresher.refreshPortfolioProvider(ref),
          ]);
        },
        error: (error, _) => context.showToast(error.toString()),
      );
    });
  }

  void _showToast(WidgetRef ref, BuildContext context) {
    final shownInAbout = ref.read(
      toggleShowingProjectInAboutProvider(project.id),
    );
    switch (shownInAbout) {
      case true:
        context.showToast(
          'Congrats! ${project.title} ${AppStrings.projectIsShownInAbout}',
        );
        break;
      case false:
        context.showToast(
          '${project.title} ${AppStrings.projectIsHiddenFromAbout}',
        );
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
