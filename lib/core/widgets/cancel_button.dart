import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadButton;

import '../utils/app_strings.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadButton.outline(
      child: const Text(AppStrings.cancel),
      onPressed: () => context.pop(),
    );
  }
}
