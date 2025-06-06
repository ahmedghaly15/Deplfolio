import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;

import '../../../../../core/widgets/custom_cached_network_img.dart';
import '../../providers/image_picker_providers.dart'
    show imagePickerNotifierProvider;

class ProjectImgPickerConsumer extends ConsumerWidget {
  const ProjectImgPickerConsumer({super.key, required this.projectImgPath});

  final String projectImgPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickedImg = ref.watch(imagePickerNotifierProvider);
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        pickedImg == null
            ? CustomCachedNetworkImg(
              imageUrl: projectImgPath,
              imageBuilder:
                  (_, img) => CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: img,
                    radius: 48.r,
                  ),
            )
            : CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: FileImage(File(pickedImg.path)) as ImageProvider,
              radius: 48.r,
            ),
        IconButton.filled(
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size(24.h, 24.h),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {
            ref.read(imagePickerNotifierProvider.notifier).pickImage();
          },
          icon: Icon(LucideIcons.pen400, color: Colors.white, size: 12.h),
        ),
      ],
    );
  }
}
