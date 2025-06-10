// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart' show GlobalKey;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadFormState;

import '../../../../core/models/project.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/repository/portfolio_repo.dart';

part 'update_project_provider.g.dart';

@riverpod
GlobalKey<ShadFormState> updateProjectFormKey(Ref ref) =>
    GlobalKey<ShadFormState>();

final projectTitleProvider = StateProvider.autoDispose<String>((ref) => '');
final projectDescriptionProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);
final projectDownloadUrlProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);
final projectPromoUrlProvider = StateProvider.autoDispose<String>((ref) => '');
final projectGitHubUrlProvider = StateProvider.autoDispose<String>((ref) => '');
final projectImgPathProvider = StateProvider.autoDispose.family<String, String>(
  (ref, initialImgPth) => initialImgPth,
);

@riverpod
class UpdateProject extends _$UpdateProject {
  @override
  AsyncValue<void>? build() => null;

  Future<void> update(Project project) async {
    state = const AsyncLoading();
    final title = ref.read(projectTitleProvider);
    final description = ref.read(projectDescriptionProvider);
    final downloadUrl = ref.read(projectDownloadUrlProvider);
    final promoUrl = ref.read(projectPromoUrlProvider);
    final gitHubUrl = ref.read(projectGitHubUrlProvider);
    project = project.copyWith(
      imgPath: project.imgPath,
      title: title.isEmpty ? project.title.trim() : title.trim(),
      description:
          description.isEmpty ? project.description.trim() : description.trim(),
      downloadLink:
          downloadUrl.isEmpty ? project.downloadLink : downloadUrl.trim(),
      promoLink: promoUrl.isEmpty ? project.promoLink : promoUrl.trim(),
      gitHubLink: gitHubUrl.isEmpty ? project.gitHubLink : gitHubUrl.trim(),
      shownInAbout: project.shownInAbout,
    );
    final result = await ref
        .read(portfolioRepoProvider)
        .updateProject(ref, project);
    switch (result) {
      case SupabaseRequestSuccess():
        state = const AsyncData(null);
      case SupabaseRequestFailure(:final errorModel):
        state = AsyncError(errorModel.message, StackTrace.current);
    }
  }

  void validateAndUpdate(Project project) {
    final formKey = ref.read(updateProjectFormKeyProvider);
    if (formKey.currentState!.validate()) {
      update(project);
    }
  }
}

final isUpdateProjectButtonEnabledProvider = StateProvider.autoDispose
    .family<bool, Project>((ref, initialValues) {
      final title = ref.watch(projectTitleProvider);
      final description = ref.watch(projectDescriptionProvider);
      final downloadUrl = ref.watch(projectDownloadUrlProvider);
      final promoUrl = ref.watch(projectPromoUrlProvider);
      final gitHubUrl = ref.watch(projectGitHubUrlProvider);
      final hasChanged =
          (title.isNotEmpty && title != initialValues.title) ||
          (description.isNotEmpty &&
              description != initialValues.description) ||
          (!downloadUrl.isNullOrEmpty &&
              downloadUrl != initialValues.downloadLink) ||
          (!promoUrl.isNullOrEmpty && promoUrl != initialValues.promoLink) ||
          (!gitHubUrl.isNullOrEmpty && gitHubUrl != initialValues.gitHubLink);
      return hasChanged;
    });
