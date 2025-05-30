import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../theming/text_styles_manager.dart';
import 'adaptive_circular_progress_indicator.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.text,
    this.child,
    this.isLoading = false,
    this.onPressed,
  });

  final String? text;
  final Widget? child;
  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ShadButton(
      onPressed: onPressed,
      leading: isLoading ? const AdaptiveCircularProgressIndicator() : null,
      child:
          text != null
              ? Text(
                text!,
                style: TextStylesManager.font12Regular.copyWith(
                  color: Colors.white,
                ),
              )
              : child,
    );
  }
}
