import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;

import '../../../../../core/models/project.dart';
import '../../../../../core/widgets/custom_cached_network_img.dart';
import 'edit_project_dialog_form_consumer.dart';

class EditProjectDialogContent extends StatelessWidget {
  const EditProjectDialogContent({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16.h,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            AspectRatio(
              aspectRatio: 4,
              child: CustomCachedNetworkImg(
                imageUrl: project.imgPath,
                imageBuilder:
                    (_, img) =>
                        CircleAvatar(backgroundImage: img, radius: 24.r),
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(LucideIcons.pen400)),
          ],
        ),
        EditProjectDialogFormConsumer(project: project),
      ],
    );
  }
}
