// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/repository/portfolio_repo.dart';
import 'image_picker_providers.dart' show imagePickerNotifierProvider;

part 'upload_img_provider.g.dart';

@riverpod
class UploadImg extends _$UploadImg {
  @override
  AsyncValue<String> build() => const AsyncValue.data('');

  Future<void> execute({String? path}) async {
    final pickedImg = ref.read(imagePickerNotifierProvider);
    if (pickedImg == null) return;
    state = const AsyncValue.loading();
    final result = await ref
        .read(portfolioRepoProvider)
        .uploadImgToSupabase(ref, pickedImg, imgPath: path);
    switch (result) {
      case SupabaseRequestSuccess(data: final imgUrl):
        state = AsyncValue.data(imgUrl);
      case SupabaseRequestFailure(:final errorModel):
        state = AsyncValue.error(errorModel.message, StackTrace.current);
    }
  }
}
