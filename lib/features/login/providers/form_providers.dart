import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginFormKeyProvider = Provider.autoDispose<GlobalKey>(
  (ref) => GlobalKey<FormState>(),
);
final emailControllerProvider = Provider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);
final passControllerProvider = Provider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

class PassToggleNotifier extends StateNotifier<bool> {
  PassToggleNotifier() : super(true);

  void toggle() => state = !state;
}

class AutovalidateModeNotifier extends StateNotifier<AutovalidateMode> {
  AutovalidateModeNotifier() : super(AutovalidateMode.disabled);

  void enable() {
    state = AutovalidateMode.onUserInteraction;
  }
}

final passToggleProvider =
    StateNotifierProvider.autoDispose<PassToggleNotifier, bool>(
      (ref) => PassToggleNotifier(),
    );

final autovalidateModeProvider = StateNotifierProvider.autoDispose<
  AutovalidateModeNotifier,
  AutovalidateMode
>((ref) => AutovalidateModeNotifier());
