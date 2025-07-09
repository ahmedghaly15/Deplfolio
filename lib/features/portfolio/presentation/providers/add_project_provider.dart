// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadFormState;

import '../../../../core/models/project.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/generate_random_id.dart';
import '../../data/repository/portfolio_repo.dart';

part 'add_project_provider.g.dart';

@riverpod
GlobalKey<ShadFormState> addProjectFormKey(Ref ref) =>
    GlobalKey<ShadFormState>();

final addProjectImgPathProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);

@riverpod
Raw<TextEditingController> addProjectTitleController(Ref ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
}

@riverpod
Raw<TextEditingController> addProjectDescriptionController(Ref ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
}

@riverpod
Raw<TextEditingController> addProjectDownloadUrlPathController(Ref ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
}

@riverpod
Raw<TextEditingController> addProjectPromoUrlPathController(Ref ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
}

@riverpod
Raw<TextEditingController> addProjectGithubUrlPathController(Ref ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
}

@riverpod
class AddProject extends _$AddProject {
  @override
  AsyncValue<void>? build() => null;

  void execute() async {
    final project = Project(
      id: generateRandomId(),
      title: ref.read(addProjectTitleControllerProvider).text,
      description: ref.read(addProjectDescriptionControllerProvider).text,
      imgPath: ref.read(addProjectImgPathProvider),
      downloadLink: ref.read(addProjectDownloadUrlPathControllerProvider).text,
      promoLink: ref.read(addProjectPromoUrlPathControllerProvider).text,
      gitHubLink: ref.read(addProjectGithubUrlPathControllerProvider).text,
      shownInAbout: false,
    );
    state = const AsyncLoading();
    final result = await ref
        .read(portfolioRepoProvider)
        .addProject(ref, project);
    switch (result) {
      case SupabaseRequestSuccess():
        state = const AsyncData(null);
      case SupabaseRequestFailure(:final errorModel):
        state = AsyncError(errorModel.message, StackTrace.current);
    }
  }
}
