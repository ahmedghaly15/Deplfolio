import 'package:flutter/material.dart' show GlobalKey;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show AutoDisposeStateProvider;
import 'package:riverpod_annotation/riverpod_annotation.dart'
    show AutoDisposeProvider;
import 'package:shadcn_ui/shadcn_ui.dart' show ShadFormState;

import 'fetch_skills.dart' show SkillModel;

class UpdateOrAddSkillFormParams {
  final AutoDisposeStateProvider<double> skillPercentProvider;
  final AutoDisposeStateProvider<String> skillNameProvider;
  final SkillModel? skill;
  final AutoDisposeProvider<GlobalKey<ShadFormState>> formKeyProvider;

  UpdateOrAddSkillFormParams({
    required this.skillPercentProvider,
    required this.skillNameProvider,
    required this.formKeyProvider,
    this.skill,
  });
}
