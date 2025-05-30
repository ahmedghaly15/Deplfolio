import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../theming/color_manager.dart';
import '../theming/text_styles_manager.dart';

class CustomInputFormField extends StatelessWidget {
  const CustomInputFormField({
    super.key,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.leading,
    this.trailing,
    this.obscureText = false,
    this.label,
    this.initialValue,
    this.onSubmitted,
    this.onSaved,
    this.autofillHints,
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.onChanged,
    this.inputPadding,
    this.focusNode,
    this.onEditingComplete,
    this.textCapitalization = TextCapitalization.none,
    this.validating,
    this.focusedBorder,
    this.errorBorder,
    this.border,
    this.autofocus = false,
    this.maxLines = 1,
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
  final bool obscureText, enabled, enableSuggestions, autofocus;
  final List<String>? autofillHints;
  final TextCapitalization textCapitalization;
  final Function(String submittedText)? onSubmitted;
  final Function(String? value)? onSaved;
  final String? initialValue;
  final TextAlign textAlign;
  final EdgeInsets? inputPadding;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validating;
  final ShadBorder? focusedBorder, errorBorder, border;
  final int? maxLines, minLines, maxLength;
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
      label: label,
      description: description,
      placeholder: placeholder,
      placeholderStyle: _textFieldTextStyle.copyWith(
        color: ColorManager.colorA4A4A4,
      ),
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
      style: _textFieldTextStyle,
      maxLines: maxLines,
      minLines: minLines,
      inputPadding: inputPadding ?? _inputPadding,
      decoration: ShadDecoration(
        errorStyle: TextStyle(fontSize: 13.sp, color: Colors.red),
        focusedBorder:
            focusedBorder ??
            _textFieldUnderlineInputBorder(
              borderColor: ColorManager.primaryColor,
              width: 2,
            ),
        errorBorder:
            errorBorder ??
            _textFieldUnderlineInputBorder(borderColor: Colors.red, width: 1.3),
        border: border ?? _textFieldUnderlineInputBorder(),
      ),
    );
  }

  static EdgeInsets get _inputPadding =>
      EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h);

  static TextStyle get _textFieldTextStyle => TextStylesManager.font12Regular;

  static ShadBorder _textFieldUnderlineInputBorder({
    Color? borderColor,
    double width = 1,
  }) {
    return ShadBorder(
      radius: BorderRadius.circular(16.r),
      top: _inputBorderSide(borderColor, width),
      bottom: _inputBorderSide(borderColor, width),
      left: _inputBorderSide(borderColor, width),
      right: _inputBorderSide(borderColor, width),
    );
  }

  static ShadBorderSide _inputBorderSide(Color? borderColor, double width) {
    return ShadBorderSide(
      color: borderColor ?? ColorManager.colorA4A4A4,
      width: width.w,
    );
  }
}
