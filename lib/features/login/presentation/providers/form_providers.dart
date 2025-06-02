import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

part 'form_providers.g.dart';

@riverpod
GlobalKey<ShadFormState> loginFormKey(Ref ref) => GlobalKey<ShadFormState>();

@riverpod
Raw<TextEditingController> emailController(Ref ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
}

@riverpod
Raw<TextEditingController> passController(Ref ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
}

final passFocusNodeProvider = Provider.autoDispose<FocusNode>((ref) {
  final focusNode = FocusNode();
  ref.onDispose(focusNode.dispose);
  return focusNode;
});

class PassToggleNotifier extends StateNotifier<bool> {
  PassToggleNotifier() : super(true);

  void toggle() => state = !state;
}

final passToggleProvider =
    StateNotifierProvider.autoDispose<PassToggleNotifier, bool>(
      (ref) => PassToggleNotifier(),
    );
