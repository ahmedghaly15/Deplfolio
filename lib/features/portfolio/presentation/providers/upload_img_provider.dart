import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/repository/portfolio_repo.dart';
import 'image_picker_providers.dart' show imagePickerNotifierProvider;

part 'upload_img_provider.g.dart';

@riverpod
class UploadImg extends _$UploadImg {
  @override
  AsyncValue<String> build() => const AsyncValue.data('');

  void uploadImg() async {
    state = const AsyncValue.loading();
    final result = await ref
        .read(portfolioRepoProvider)
        .uploadImgToSupabase(ref, ref.read(imagePickerNotifierProvider)!);
    switch (result) {
      case SupabaseRequestSuccess(data: final imgUrl):
        state = AsyncValue.data(imgUrl);
      case SupabaseRequestFailure(:final errorModel):
        state = AsyncValue.error(errorModel.message, StackTrace.current);
    }
  }
}
