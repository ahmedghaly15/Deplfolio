// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadFormState;

import '../../../../core/models/project.dart';
import '../../../../core/providers/autovalidate_mode_notifier.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/generate_random_id.dart';
import '../../data/repository/portfolio_repo.dart';

part 'add_new_project_provider.g.dart';

@riverpod
GlobalKey<ShadFormState> addProjectFormKey(Ref ref) =>
    GlobalKey<ShadFormState>();

final addNewProjectImgUrlProvider = StateProvider<String>((ref) => '');

final addNewProjectTitleProvider = StateProvider<String>((ref) => '');

@Riverpod(keepAlive: true)
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
class AddNewProject extends _$AddNewProject {
  @override
  AsyncValue<void>? build() => null;

  void _addProject() async {
    final project = Project(
      id: generateRandomId(),
      title: ref.read(addNewProjectTitleProvider),
      description: ref.read(addProjectDescriptionControllerProvider).text,
      imgPath: ref.read(addNewProjectImgUrlProvider),
      downloadLink: ref.read(addProjectDownloadUrlPathControllerProvider).text,
      promoLink: ref.read(addProjectPromoUrlPathControllerProvider).text,
      gitHubLink: ref.read(addProjectGithubUrlPathControllerProvider).text,
      shownInAbout: false,
    );
    state = const AsyncValue.loading();
    final result = await ref
        .read(portfolioRepoProvider)
        .addProject(ref, project);
    switch (result) {
      case SupabaseRequestSuccess():
        state = const AsyncValue.data(null);
      case SupabaseRequestFailure(:final errorModel):
        state = AsyncValue.error(errorModel.message, StackTrace.current);
    }
  }

  void validateAndAddProject() {
    final formKey = ref.read(addProjectFormKeyProvider);
    if (formKey.currentState!.validate()) {
      _addProject();
    } else {
      ref.read(autovalidateModeProvider.notifier).enable();
    }
  }
}
