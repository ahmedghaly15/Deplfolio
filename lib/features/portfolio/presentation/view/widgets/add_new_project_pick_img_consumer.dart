import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;

import '../../../../../core/theming/color_manager.dart';
import '../../providers/image_picker_providers.dart';

class AddNewProjectPickImgConsumer extends ConsumerWidget {
  const AddNewProjectPickImgConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickedImg = ref.watch(imagePickerNotifierProvider);
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          backgroundColor: ColorManager.darkModeColor.withAlpha(50),
          backgroundImage:
              pickedImg == null
                  ? null
                  : FileImage(File(pickedImg.path)) as ImageProvider,
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
            // TODO: Use upload img to supabase
          },
          icon: Icon(LucideIcons.pen400, color: Colors.white, size: 12.h),
        ),
      ],
    );
  }
}
