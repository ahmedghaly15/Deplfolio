import 'package:flutter/material.dart';

import '../../../data/models/fetch_skills.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key, required this.skills});

  final FetchSkills skills;

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [],
    );
  }
}
