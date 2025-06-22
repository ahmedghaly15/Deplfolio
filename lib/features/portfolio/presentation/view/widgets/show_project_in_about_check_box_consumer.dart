import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadCheckbox;

import '../../../../../core/models/project.dart' show Project;
import '../../providers/show_or_hide_project_from_about_provider.dart';

class ShowProjectInAboutCheckboxConsumer extends ConsumerWidget {
  const ShowProjectInAboutCheckboxConsumer({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShown = ref.watch(
      toggleShowOrHideProjectFromAboutProvider(project.shownInAbout),
    );
    return ShadCheckbox(
      value: isShown,
      onChanged: (value) {
        ref
            .read(
              toggleShowOrHideProjectFromAboutProvider(
                project.shownInAbout,
              ).notifier,
            )
            .state = !isShown;
      },
      label: Text(project.title, overflow: TextOverflow.ellipsis, maxLines: 1),
    );
  }
}
