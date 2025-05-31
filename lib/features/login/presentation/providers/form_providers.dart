import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

part 'form_providers.g.dart';

@riverpod
GlobalKey<ShadFormState> loginFormKey(Ref ref) => GlobalKey<ShadFormState>();

@riverpod
Raw<TextEditingController> emailController(Ref ref) => TextEditingController();

@riverpod
Raw<TextEditingController> passController(Ref ref) => TextEditingController();

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
