import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../view/widgets/add_new_project_form_consumer.dart';
import '../view/widgets/new_project_picked_img_consumer.dart';

part 'add_new_project_page_view_providers.g.dart';

@riverpod
Raw<PageController> addNewProjectPageController(Ref ref) {
  final controller = PageController(initialPage: 0);
  ref.onDispose(controller.dispose);
  return controller;
}

final addNewProjectPageViewItems = Provider.autoDispose<List<Widget>>(
  (ref) => const [
    AddNewProjectTitleFormConsumer(),
    NewProjectPickedImgConsumer(),
    AddNewProjectFormConsumer(),
  ],
);

final isLastAddNewProjectPageProvider = StateProvider.autoDispose<bool>((ref) {
  final pageIndex = ref.watch(onChangeAddNewProjectPageViewProvider);
  if (pageIndex == ref.read(addNewProjectPageViewItems).length - 1) return true;
  return false;
});

class OnChangeAddNewProjectPageView extends StateNotifier<int> {
  OnChangeAddNewProjectPageView(this._ref) : super(0);

  final Ref _ref;

  Future<void> moveNext() async {
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
