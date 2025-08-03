// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart' show GlobalKey;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadFormState;

import '../../../../core/enums/experience_status.dart';
import '../../../../core/providers/autovalidate_mode_notifier.dart'
    show autovalidateModeProvider;
import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/models/about.dart' show WorkExperienceModel;
import '../../data/repository/about_repo_impl.dart';

part 'update_work_experience_provider.g.dart';

@riverpod
GlobalKey<ShadFormState> editWorkExperienceFormKey(Ref ref) =>
    GlobalKey<ShadFormState>();

final workExperienceTitleProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);

final workExperienceStartDateProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);

final workExperienceEndDateProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);

final workExperienceCompanyProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);

final workExperienceStatusProvider = StateProvider.autoDispose
    .family<ExperienceStatus, ExperienceStatus>(
      (ref, initialStatus) => initialStatus,
    );

final workExperienceDescriptionProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);

@riverpod
class UpdateWorkExperience extends _$UpdateWorkExperience {
  @override
  AsyncValue<void>? build() => null;

  void _update(WorkExperienceModel workExperience) async {
    final title = ref.read(workExperienceTitleProvider);
    final startDate = ref.read(workExperienceStartDateProvider);
    final endDate = ref.read(workExperienceEndDateProvider);
    final company = ref.read(workExperienceCompanyProvider);
    final status = ref.read(
      workExperienceStatusProvider(workExperience.experienceStatus),
    );
    final description = ref.read(workExperienceDescriptionProvider);

    final we = workExperience.copyWith(
      id: workExperience.id,
      title: title.isEmpty ? workExperience.title.trim() : title.trim(),
      startDate:
          startDate.isEmpty
              ? workExperience.startDate.trim()
              : startDate.trim(),
      endDate: endDate.isEmpty ? workExperience.endDate.trim() : endDate.trim(),
      company: company.isEmpty ? workExperience.company.trim() : company.trim(),
      experienceStatus: status,
      description:
          description.isEmpty
              ? workExperience.description.trim()
              : description.trim(),
    );

    state = const AsyncValue.loading();
    final result = await ref
        .read(aboutRepoProvider)
        .updateWorkExperience(ref, we);
    switch (result) {
      case SupabaseRequestSuccess():
        state = const AsyncData(null);
      case SupabaseRequestFailure(:final errorModel):
        state = AsyncError(errorModel.message, StackTrace.current);
    }
  }

  void validateAndUpdate(WorkExperienceModel workExperience) {
    final formKey = ref.read(editWorkExperienceFormKeyProvider);
    if (formKey.currentState!.validate()) {
      _update(workExperience);
    } else {
      ref.read(autovalidateModeProvider.notifier).enable();
    }
  }
}

final isUpdateWeEnabledProvider = StateProvider.autoDispose
    .family<bool, WorkExperienceModel>((ref, initialValues) {
      final title = ref.watch(workExperienceTitleProvider);
      final startDate = ref.watch(workExperienceStartDateProvider);
      final endDate = ref.watch(workExperienceEndDateProvider);
      final company = ref.watch(workExperienceCompanyProvider);
      final status = ref.watch(
        workExperienceStatusProvider(initialValues.experienceStatus),
      );
      final description = ref.watch(workExperienceDescriptionProvider);
      final hasChanged =
          (title.isNotEmpty && title != initialValues.title) ||
          (startDate.isNotEmpty && startDate != initialValues.startDate) ||
          (endDate.isNotEmpty && endDate != initialValues.endDate) ||
          (company.isNotEmpty && company != initialValues.company) ||
          (status != initialValues.experienceStatus) ||
          (description.isNotEmpty && description != initialValues.description);
      return hasChanged;
    });
