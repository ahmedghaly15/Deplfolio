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

  void _update(IntroductionSection params) async {
    state = const AsyncValue.loading();
    final headerSmallText = ref.read(aboutHeaderSmallTxtProvider);
    final description = ref.read(aboutDescriptionProvider);
    final seeMyWorkLink = ref.read(aboutSeeMyWorkLinkProvider);
    final headerBigText1 = ref.read(aboutHeaderBigText1Provider);
    final headerBigText2 = ref.read(aboutHeaderBigText2Provider);
    final headerBigTextColoredString = ref.read(
      aboutHeaderBigTextColoredStringProvider,
    );
    final requestBody = IntroductionSection(
      headerSmallText:
          headerSmallText.isEmpty
              ? params.headerSmallText.trim()
              : headerSmallText.trim(),
      description:
          description.isEmpty ? params.description.trim() : description.trim(),
      seeMyWorkLink:
          seeMyWorkLink.isEmpty
              ? params.seeMyWorkLink.trim()
              : seeMyWorkLink.trim(),
      headerBigText: AboutHeaderTextModel(
        text1:
            headerBigText1.isEmpty
                ? params.headerBigText.text1.trim()
                : headerBigText1.trim(),
        text2:
            headerBigText2.isEmpty
                ? params.headerBigText.text2.trim()
                : headerBigText2.trim(),
        coloredString:
            headerBigTextColoredString.isEmpty
                ? params.headerBigText.coloredString.trim()
                : headerBigTextColoredString.trim(),
      ),
    );
    final result = await ref
        .read(aboutRepoProvider)
        .updateIntroductionSection(ref, requestBody);
    switch (result) {
      case SupabaseRequestSuccess():
        state = const AsyncValue.data(null);
      case SupabaseRequestFailure(:final errorModel):
        state = AsyncValue.error(errorModel.message, StackTrace.current);
    }
  }

  void validateAndUpdate(IntroductionSection params) {
    final formKey = ref.read(introductionSectionFormKeyProvider);
    if (formKey.currentState!.validate()) {
      _update(params);
    } else {
      ref.read(autovalidateModeProvider.notifier).enable();
    }
  }
}
