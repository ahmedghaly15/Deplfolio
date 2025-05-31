import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../providers/form_providers.dart';
import 'email_field_consumer.dart';
import 'pass_input_field_consumer.dart';

class LoginFormConsumer extends ConsumerWidget {
  const LoginFormConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(loginFormKeyProvider);
    return ShadForm(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16.w,
        children: const [EmailFieldConsumer(), PassInputFieldConsumer()],
      ),
    );
  }
}
