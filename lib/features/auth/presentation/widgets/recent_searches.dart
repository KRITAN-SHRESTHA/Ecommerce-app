import 'package:ecommerceapp/core/utils/color.dart';
import 'package:ecommerceapp/core/utils/extension.dart';
import 'package:ecommerceapp/core/utils/string.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:flutter/material.dart';

class RecentSearches extends StatelessWidget {
  const RecentSearches({
    super.key,
    required this.searches,
    required this.onClearAll,
    required this.onRemove,
  });

  final List<String> searches;
  final VoidCallback onClearAll;
  final ValueChanged<int> onRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(kRecentSearchesTitle, style: textBody2SemiBold),
            const Spacer(),
            InkWell(
              onTap: onClearAll,
              child: Text(
                kClearAllText,
                style: textBody2SemiBold.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ).py(20),
        ...List.generate(searches.length, (index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Expanded(
                    child: Text(searches[index], style: textBody1).py(10),
                  ),
                  GestureDetector(
                    onTap: () => onRemove(index),
                    child: const Icon(
                      Icons.cancel_outlined,
                      size: 22,
                      color: kGrey400,
                    ),
                  ),
                ],
              ),

              const Divider(height: 1, color: kGrey200),
            ],
          );
        }),
      ],
    );
  }
}
