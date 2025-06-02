import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadFormState;

part 'introduction_section_form_providers.g.dart';

@riverpod
GlobalKey<ShadFormState> introductionSectionFormKey(Ref ref) =>
    GlobalKey<ShadFormState>();

@riverpod
Raw<TextEditingController> aboutHeaderSmallTxtController(Ref ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
}

@riverpod
Raw<TextEditingController> aboutDescriptionController(Ref ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
}

@riverpod
Raw<TextEditingController> aboutSeeMyWorkLinkController(Ref ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
}

@riverpod
Raw<TextEditingController> aboutHeaderBigText1Controller(Ref ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
}

@riverpod
Raw<TextEditingController> aboutHeaderBigText2Controller(Ref ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
}

@riverpod
Raw<TextEditingController> aboutHeaderBigTextColoredStringController(Ref ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
}
