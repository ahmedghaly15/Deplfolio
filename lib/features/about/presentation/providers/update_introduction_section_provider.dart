import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/providers/autovalidate_mode_notifier.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/models/about.dart';
import '../../data/models/introduction_section.dart';
import '../../data/repository/about_repo.dart';
import 'introduction_section_form_providers.dart';

part 'update_introduction_section_provider.g.dart';

@riverpod
class UpdateIntroductionSection extends _$UpdateIntroductionSection {
  @override
  AsyncValue<void>? build() => null;

  void _update() async {
    state = const AsyncValue.loading();
    final params = IntroductionSection(
      headerSmallText: ref.read(aboutHeaderSmallTxtProvider),
      description: ref.read(aboutDescriptionProvider),
      seeMyWorkLink: ref.read(aboutSeeMyWorkLinkProvider),
      headerBigText: AboutHeaderTextModel(
        text1: ref.read(aboutHeaderBigText1Provider),
        text2: ref.read(aboutHeaderBigText2Provider),
        coloredString: ref.read(aboutHeaderBigTextColoredStringProvider),
      ),
    );
    final result = ref
        .read(aboutRepoProvider)
        .updateIntroductionSection(ref, params);
    switch (result) {
      case SupabaseRequestSuccess():
        state = const AsyncValue.data(null);
      case SupabaseRequestFailure(:final errorModel):
        state = AsyncValue.error(errorModel.message, StackTrace.current);
    }
  }

  void validateAndUpdate() {
    final formKey = ref.read(introductionSectionFormKeyProvider);
    if (formKey.currentState!.validate()) {
      _update();
    } else {
      ref.read(autovalidateModeProvider.notifier).enable();
    }
  }
}
