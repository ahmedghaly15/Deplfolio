import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/models/about.dart';
import '../../data/repository/about_repo.dart';

part 'about_provider.g.dart';

final fetchAboutProvider = FutureProvider.autoDispose<About?>((ref) async {
  final result = await ref.read(aboutRepoProvider).fetchAbout(ref);
  switch (result) {
    case SupabaseRequestSuccess(:final data):
      return data;
    case SupabaseRequestFailure(:final errorModel):
      throw errorModel.message;
  }
});

final introductionSectionFormKeyProvider =
    Provider.autoDispose<GlobalKey<FormState>>((ref) {
      return GlobalKey<FormState>();
    });

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
