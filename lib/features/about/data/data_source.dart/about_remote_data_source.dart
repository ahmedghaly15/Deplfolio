import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/data_source/remote_data_source.dart';
import '../models/about.dart';

final aboutRemoteDataSourceProvider =
    Provider.autoDispose<AboutRemoteDataSource>((ref) {
      final remoteDataSource = ref.read(remoteDataSourceProvider);
      return AboutRemoteDataSource(remoteDataSource);
    });

class AboutRemoteDataSource {
  final RemoteDataSource _remoteDataSource;

  AboutRemoteDataSource(this._remoteDataSource);

  Future<About> fetchAbout() async {
    final portfolioJson = await _remoteDataSource.fetchRemotePortfolioJson();
    final aboutJson = portfolioJson['about'] as Map<String, dynamic>;
    return About.fromJson(aboutJson);
  }
}
