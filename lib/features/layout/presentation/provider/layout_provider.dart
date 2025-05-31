import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../about/presentation/view/about_view_consumer.dart';
import '../../../portfolio/presentation/view/portfolio_view.dart';
import '../../../skills/presentation/view/skills_view.dart';

class LayoutActiveTabNotifier extends StateNotifier<int> {
  LayoutActiveTabNotifier() : super(0);

  void setActiveTab(int index) => state = index;
}

final layoutActiveTabProvider =
    StateNotifierProvider.autoDispose<LayoutActiveTabNotifier, int>(
      (_) => LayoutActiveTabNotifier(),
    );

final layoutActiveWidgetProvider = Provider.autoDispose<Widget>((ref) {
  const List<Widget> views = [
    AboutViewConsumer(),
    SkillsView(),
    PortfolioView(),
  ];
  final activeTabIndex = ref.watch(layoutActiveTabProvider);
  return views[activeTabIndex];
});
