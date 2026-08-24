import 'package:ecommerceapp/core/utils/color.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? kPrimaryColor : kWhiteColor,
          borderRadius: BorderRadius.circular(10),
          border: selected ? null : Border.all(color: kGrey200),
        ),
        child: Text(
          label,
          style: selected
              ? textBody1SemiBold.copyWith(color: kWhiteColor)
              : textBody1,
        ),
      ),
    );
  }
}
