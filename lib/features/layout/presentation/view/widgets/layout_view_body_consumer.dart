import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../about/presentation/view/about_view.dart';
import '../../../../portfolio/presentation/view/portfolio_view.dart';
import '../../../../skills/presentation/view/skills_view.dart';
import '../../provider/layout_provider.dart';

class LayoutViewBodyConsumer extends ConsumerWidget {
  const LayoutViewBodyConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTabIndex = ref.watch(layoutActiveTabProvider);
    return _views[activeTabIndex];
  }

  final List<Widget> _views = const [
    AboutView(),
    SkillsView(),
    PortfolioView(),
  ];
}
