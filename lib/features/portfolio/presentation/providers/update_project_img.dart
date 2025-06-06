import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/models/update_project_img_params.dart';
import '../../data/repository/portfolio_repo.dart';
import 'image_picker_providers.dart' show imagePickerNotifierProvider;

part 'update_project_img.g.dart';

@riverpod
class UpdateProjectImg extends _$UpdateProjectImg {
  @override
  AsyncValue<String> build() => const AsyncValue.data('');

  void execute(String projectTitle) async {
    state = const AsyncValue.loading();
    final params = UpdateProjectImgParams(
      projectTitle: projectTitle,
      pickedImgFile: ref.read(imagePickerNotifierProvider)!,
    );
    final result = await ref
        .read(portfolioRepoProvider)
        .updateProjectImg(ref, params);
    switch (result) {
      case SupabaseRequestSuccess(data: final imgUrl):
        state = AsyncValue.data(imgUrl);
      case SupabaseRequestFailure(:final errorModel):
        state = AsyncValue.error(errorModel.message, StackTrace.current);
    }
  }
}
