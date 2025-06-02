import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../about/presentation/view/about_view_consumer.dart';
import '../../../portfolio/presentation/view/portfolio_view_consumer.dart';
import '../../../skills/presentation/view/skills_view_consumer.dart';

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
    SkillsViewConsumer(),
    PortfolioViewConsumer(),
  ];
  final activeTabIndex = ref.watch(layoutActiveTabProvider);
  return views[activeTabIndex];
});
