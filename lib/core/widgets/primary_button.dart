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
    this.expands,
  });

  final String? text;
  final Widget? child, leading;
  final VoidCallback? onPressed;
  final bool? expands;

  @override
  Widget build(BuildContext context) {
    return ShadButton(
      onPressed: onPressed,
      leading: leading,
      expands: expands,
      child:
          child ??
          Text(
            text!,
            style: context.shadTextTheme.p.copyWith(color: Colors.white),
          ),
    );
  }
}
