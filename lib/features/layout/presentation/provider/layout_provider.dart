import 'package:flutter_riverpod/flutter_riverpod.dart';

class LayoutActiveTabNotifier extends StateNotifier<int> {
  LayoutActiveTabNotifier() : super(0);

  void setActiveTab(int index) => state = index;
}

final layoutActiveTabProvider =
    StateNotifierProvider.autoDispose<LayoutActiveTabNotifier, int>(
      (_) => LayoutActiveTabNotifier(),
    );
