import 'package:flutter/material.dart';

import 'widgets/layout_view_body_consumer.dart';
import 'widgets/navigation_bar_consumer.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LayoutViewBodyConsumer(),
      bottomNavigationBar: NavigationBarConsumer(),
    );
  }
}
