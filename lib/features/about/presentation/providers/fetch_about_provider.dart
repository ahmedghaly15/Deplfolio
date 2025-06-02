import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/models/about.dart';
import '../../data/repository/about_repo.dart';

final fetchAboutProvider = FutureProvider.autoDispose<About?>((ref) async {
  final result = await ref.read(aboutRepoProvider).fetchAbout(ref);
  switch (result) {
    case SupabaseRequestSuccess(:final data):
      return data;
    case SupabaseRequestFailure(:final errorModel):
      throw errorModel.message;
  }
});
