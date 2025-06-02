import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AutovalidateModeNotifier extends StateNotifier<AutovalidateMode> {
  AutovalidateModeNotifier() : super(AutovalidateMode.disabled);

  void enable() {
    state = AutovalidateMode.onUserInteraction;
  }
}

final autovalidateModeProvider = StateNotifierProvider.autoDispose<
  AutovalidateModeNotifier,
  AutovalidateMode
>((ref) => AutovalidateModeNotifier());
