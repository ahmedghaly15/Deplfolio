import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../theming/color_manager.dart';

class CustomDataInput extends StatelessWidget {
  const CustomDataInput({
    super.key,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.leading,
    this.trailing,
    this.obscureText = false,
    this.label,
    this.labelText,
    this.initialValue,
    this.onSubmitted,
    this.onSaved,
    this.autofillHints,
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.onChanged,
    this.focusNode,
    this.onEditingComplete,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.focusedBorder,
    this.errorBorder,
    this.border,
    this.autofocus = false,
    this.minLines,
    this.enableSuggestions = true,
    this.description,
    this.placeholder,
    this.autovalidateMode,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? leading, trailing, label, description, placeholder;
  final String? labelText;
  final bool obscureText, enabled, enableSuggestions, autofocus;
  final List<String>? autofillHints;
  final TextCapitalization textCapitalization;
  final Function(String submittedText)? onSubmitted;
  final Function(String? value)? onSaved;
  final String? initialValue;
  final TextAlign textAlign;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final ShadBorder? focusedBorder, errorBorder, border;
  final int? minLines, maxLength;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return ShadInputFormField(
      initialValue: initialValue,
      autovalidateMode: autovalidateMode,
      controller: controller,
      leading: leading,
      trailing: trailing,
      label:
          label ??
          Text(
            labelText ?? '',
            style: context.shadTextTheme.small.copyWith(
              color: ColorManager.colorA4A4A4,
            ),
          ),
      description: description,
      placeholder: placeholder,
      focusNode: focusNode,
      enabled: enabled,
      autofocus: autofocus,
      enableSuggestions: enableSuggestions,
      textCapitalization: textCapitalization,
      textAlign: textAlign,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLength: maxLength,
      onSaved: onSaved,
      autofillHints: autofillHints,
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      maxLines: null,
      minLines: minLines,
      validator: validator,
      onPressedOutside: (_) => context.unfocusKeyboard(),
    );
  }
}
