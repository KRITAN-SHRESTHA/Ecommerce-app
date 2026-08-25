import 'package:ecommerceapp/core/utils/assets.dart';
import 'package:ecommerceapp/core/utils/color.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.imagePath,
    required this.name,
    required this.price,
    this.discountPercent,
    this.isFavorite = false,
    this.onFavoriteTap,
  });

  final String? imagePath;
  final String name;
  final String price;
  final int? discountPercent;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 0.85,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: kGrey200,
                  child: imagePath != null
                      ? Image.asset(imagePath!, fit: BoxFit.cover)
                      : null,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: kGrey400.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: onFavoriteTap,
                    child: Center(
                      child: SvgPicture.asset(
                        isFavorite ? kFavouriteIcon : kSaveIcon,
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          isFavorite ? kErrorColor : kPrimaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          name,
          style: textBody1SemiBold,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text('\$ $price', style: textBody1.copyWith(color: kGrey600)),
            if (discountPercent != null) ...[
              const SizedBox(width: 6),
              Text(
                '-$discountPercent%',
                style: textBody1.copyWith(color: kErrorColor),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
