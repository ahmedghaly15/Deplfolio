import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../theming/color_manager.dart';

class CustomCachedNetworkImg extends StatelessWidget {
  const CustomCachedNetworkImg({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.imageBuilder,
    this.height,
    this.width,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.fadeOutDuration = const Duration(milliseconds: 1000),
  });

  final String imageUrl;
  final BoxFit fit;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final double? height, width;
  final Duration fadeInDuration;
  final Duration? fadeOutDuration;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: height,
      height: width,
      imageBuilder: imageBuilder,
      fadeInDuration: fadeInDuration,
      fadeOutDuration: fadeOutDuration,
      errorWidget:
          (_, __, ___) => const Icon(
            LucideIcons.circleAlert,
            color: ColorManager.primaryColor,
          ),
    );
  }
}
