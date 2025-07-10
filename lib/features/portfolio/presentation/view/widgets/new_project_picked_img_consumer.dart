import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/color_manager.dart';
import '../../providers/image_picker_providers.dart';

class NewProjectPickedImgConsumer extends ConsumerWidget {
  const NewProjectPickedImgConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickedImg = ref.watch(imagePickerNotifierProvider);
    return CircleAvatar(
      backgroundColor: ColorManager.primaryColor.withAlpha(50),
      backgroundImage:
          pickedImg == null
              ? null
              : FileImage(File(pickedImg.path)) as ImageProvider,
      radius: 48.r,
    );
  }
}
