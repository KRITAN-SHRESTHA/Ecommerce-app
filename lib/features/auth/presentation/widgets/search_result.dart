import 'package:ecommerceapp/core/utils/assets.dart';
import 'package:ecommerceapp/core/utils/color.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchResultItem {
  const SearchResultItem({
    required this.itemName,
    required this.price,
    this.imagePath,
    this.discountPercent,
  });

  final String itemName;
  final String price;
  final String? imagePath;
  final int? discountPercent;
}

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, required this.results});

  final List<SearchResultItem> results;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (context, index) =>
          const Divider(color: kGrey200, thickness: 0.5),
      itemBuilder: (context, index) {
        final result = results[index];
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          color: kGrey200,
                          child: result.imagePath != null
                              ? Image.asset(
                                  result.imagePath!,
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(result.itemName, style: textBody1SemiBold),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                '\$ ${result.price}',
                                style: textBody1.copyWith(color: kGrey600),
                              ),
                              if (result.discountPercent != null) ...[
                                const SizedBox(width: 6),
                                Text(
                                  '-${result.discountPercent}%',
                                  style: textBody1.copyWith(color: kErrorColor),
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            SvgPicture.asset(kArrowIcon, width: 30, height: 30),
          ],
        );
      },
    );
  }
}
