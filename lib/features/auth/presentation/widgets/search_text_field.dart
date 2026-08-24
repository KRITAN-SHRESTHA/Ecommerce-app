import 'package:ecommerceapp/core/utils/assets.dart';
import 'package:ecommerceapp/core/utils/color.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.onChanged,
    this.onMicTap,
    this.onTap,
    this.readOnly = false,
  });

  final TextEditingController controller;
  final String hint;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onMicTap;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kGrey200),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        readOnly: readOnly,
        style: textBody1,
        autofocus: true,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: textBody1.copyWith(color: kGrey500),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 12),
            child: SvgPicture.asset(
              kSearchIcon,
              width: 22,
              height: 22,
              colorFilter: const ColorFilter.mode(kGrey500, BlendMode.srcIn),
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 22,
            minHeight: 22,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20, left: 12),
            child: GestureDetector(
              onTap: onMicTap,
              child: SvgPicture.asset(
                kMicIcon,
                width: 22,
                height: 22,
                colorFilter: const ColorFilter.mode(kGrey500, BlendMode.srcIn),
              ),
            ),
          ),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 22,
            minHeight: 22,
          ),
        ),
      ),
    );
  }
}
