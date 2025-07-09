import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../view/widgets/add_new_project_form_consumer.dart';
import '../view/widgets/add_new_project_pick_img_consumer.dart';

part 'add_new_project_page_view_providers.g.dart';

@riverpod
Raw<PageController> addNewProjectPageController(Ref ref) {
  final controller = PageController(initialPage: 0);
  ref.onDispose(controller.dispose);
  return controller;
}

final addNewProjectPageViewItems = Provider.autoDispose<List<Widget>>(
  (ref) => const [AddNewProjectPickImgConsumer(), AddNewProjectFormConsumer()],
);

final isLastAddNewProjectPageProvider = StateProvider.autoDispose<bool>((ref) {
  final pageIndex = ref.watch(onChangeAddNewProjectPageViewProvider);
  if (pageIndex == ref.read(addNewProjectPageViewItems).length - 1) return true;
  return false;
});

class OnChangeAddNewProjectPageView extends StateNotifier<int> {
  OnChangeAddNewProjectPageView(this._ref) : super(0);

  final Ref _ref;

  void onChange(int index) => state = index;

  Future<void> moveNext() async {
    if (_ref.read(isLastAddNewProjectPageProvider)) return;
    await _ref
        .read(addNewProjectPageControllerProvider)
        .nextPage(
          duration: const Duration(seconds: 1),
          curve: Curves.fastEaseInToSlowEaseOut,
        );
    state++;
  }
}

final onChangeAddNewProjectPageViewProvider =
    StateNotifierProvider.autoDispose<OnChangeAddNewProjectPageView, int>(
      (ref) => OnChangeAddNewProjectPageView(ref),
    );
