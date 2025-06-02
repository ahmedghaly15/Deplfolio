import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/api/dio_factory.dart';
import '../../../../core/api/end_points.dart';
import '../models/upload_cv_request_body.dart';

part 'about_api_service.g.dart';

final aboutApiServiceProvider = Provider.autoDispose<AboutApiService>((ref) {
  final dio = ref.read(dioProvider);
  return AboutApiService(dio);
});

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class AboutApiService {
  factory AboutApiService(Dio dio, {String baseUrl}) = _AboutApiService;

  @PUT('${EndPoints.uploadToRepo}{saferFilePathUrl}')
  Future<void> uploadCvToRepo(
    @Path('saferFilePathUrl') String saferFilePathUrl,
    @Body() UploadCvRequestBody body,
  );
}
