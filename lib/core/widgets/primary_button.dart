import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../theming/text_styles_manager.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.text,
    this.child,
    this.leading,
    this.onPressed,
  });

  final String? text;
  final Widget? child, leading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ShadButton(
      onPressed: onPressed,
      leading: leading,
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
