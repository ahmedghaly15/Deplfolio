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
    ref.listen(imagePickerNotifierProvider, (_, current) {
      if (current != null) {}
    });
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        AspectRatio(
          aspectRatio: 4,
          child:
              pickedImg == null
                  ? CustomCachedNetworkImg(
                    imageUrl: projectImgPath,
                    imageBuilder:
                        (_, img) =>
                            CircleAvatar(backgroundImage: img, radius: 24.r),
                  )
                  : CircleAvatar(
                    backgroundImage:
                        FileImage(File(pickedImg.path)) as ImageProvider,
                    radius: 24.r,
                  ),
        ),
        IconButton.filled(
          onPressed: () {
            ref.read(imagePickerNotifierProvider.notifier).pickImage();
          },
          icon: const Icon(LucideIcons.pen400, color: Colors.white),
        ),
      ],
    );
  }
}
