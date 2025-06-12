import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadFormState;

import '../../../../core/providers/autovalidate_mode_notifier.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/models/about.dart' show ApproachModel;
import '../../data/repository/about_repo.dart' show aboutRepoProvider;

part 'update_approach_provider.g.dart';

@riverpod
GlobalKey<ShadFormState> updateApproachFormKey() => GlobalKey<ShadFormState>();

final approachTitleProvider = StateProvider.autoDispose<String>((ref) => '');

final approachDescriptionProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);

@riverpod
class UpdateApproach extends _$UpdateApproach {
  @override
  AsyncValue<void>? build() => null;

  void _update(ApproachModel approachModel) async {
    final titleProviderValue = ref.read(approachTitleProvider);
    final descriptionProviderValue = ref.read(approachDescriptionProvider);
    final approach = ApproachModel(
      id: approachModel.id,
      title:
          titleProviderValue.isEmpty
              ? approachModel.title.trim()
              : titleProviderValue.trim(),
      description:
          descriptionProviderValue.isEmpty
              ? approachModel.description.trim()
              : descriptionProviderValue.trim(),
    );
    state = const AsyncValue.loading();
    final result = await ref
        .read(aboutRepoProvider)
        .updateApproach(ref, approach);
    switch (result) {
      case SupabaseRequestSuccess():
        state = const AsyncValue.data(null);
      case SupabaseRequestFailure(:final errorModel):
        state = AsyncValue.error(errorModel.message, StackTrace.current);
    }
  }

  void validateAndUpdate(ApproachModel approachModel) {
    final formKey = ref.read(updateApproachFormKeyProvider);
    if (formKey.currentState!.validate()) {
      _update(approachModel);
    } else {
      ref.read(autovalidateModeProvider.notifier).enable();
    }
  }
}
