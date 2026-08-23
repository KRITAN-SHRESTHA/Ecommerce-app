import 'package:ecommerceapp/core/utils/color.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:flutter/material.dart';

enum AuthFieldStatus { neutral, error, success }

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.status = AuthFieldStatus.neutral,
    this.errorText,
    this.obscureText = false,
    this.showObscureToggle = false,
    this.onToggleObscure,
    this.onChanged,
    this.keyboardType,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final AuthFieldStatus status;
  final String? errorText;
  final bool obscureText;
  final bool showObscureToggle;
  final VoidCallback? onToggleObscure;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;

  Color get _borderColor => switch (status) {
    AuthFieldStatus.error => kErrorColor,
    AuthFieldStatus.success => kSuccessColor,
    AuthFieldStatus.neutral => kGrey300,
  };

  Widget? get _suffixIcon {
    if (status == AuthFieldStatus.success) {
      return const Icon(
        Icons.check_circle_outline_outlined,
        color: kSuccessColor,
      );
    }
    if (status == AuthFieldStatus.error) {
      return const Icon(Icons.error, color: kErrorColor);
    }
    if (showObscureToggle) {
      return IconButton(
        icon: Icon(
          obscureText ? Icons.visibility_off : Icons.visibility,
          color: kGrey500,
        ),
        onPressed: onToggleObscure,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textBody2Medium),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChanged,
          style: textBody1,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: textBody1.copyWith(color: kGrey500),
            suffixIcon: _suffixIcon,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: _borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: _borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: _borderColor, width: 1.5),
            ),
          ),
        ),
        if (status == AuthFieldStatus.error && errorText != null) ...[
          const SizedBox(height: 6),
          Text(errorText!, style: textBody3.copyWith(color: kErrorColor)),
        ],
      ],
    );
  }
}
