import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
          child ??
          Text(
            text!,
            style: context.shadTextTheme.p.copyWith(color: Colors.white),
          ),
    );
  }
}
