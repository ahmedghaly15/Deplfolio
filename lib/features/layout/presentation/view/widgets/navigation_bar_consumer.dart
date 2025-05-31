import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../provider/layout_provider.dart';
import 'navigation_destination.dart';

class NavigationBarConsumer extends ConsumerWidget {
  const NavigationBarConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTabIndex = ref.watch(layoutActiveTabProvider);
    return NavigationBar(
      animationDuration: const Duration(milliseconds: 500),
      selectedIndex: activeTabIndex,
      onDestinationSelected: (index) {
        ref.read(layoutActiveTabProvider.notifier).setActiveTab(index);
      },
      destinations: const [
        AnimatedNavigationDestination(
          icon: LucideIcons.badgeInfo400,
          label: 'About',
        ),
        AnimatedNavigationDestination(
          icon: LucideIcons.code400,
          label: 'Skills',
        ),
        AnimatedNavigationDestination(
          icon: LucideIcons.layoutDashboard400,
          label: 'Portfolio',
        ),
      ],
    );
  }
}
