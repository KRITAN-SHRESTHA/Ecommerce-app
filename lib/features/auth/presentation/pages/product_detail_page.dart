import 'package:auto_route/auto_route.dart';
import 'package:ecommerceapp/config/routes/routes.dart';
import 'package:ecommerceapp/core/utils/assets.dart';
import 'package:ecommerceapp/core/utils/color.dart';
import 'package:ecommerceapp/core/utils/extension.dart';
import 'package:ecommerceapp/core/utils/string.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  static const _sizes = ['S', 'M', 'L'];

  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.router.maybePop(),
                    child: const Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(kDetailsTitle, style: textHeader4),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.router.push(NotificaitonRoute()),
                    child: SvgPicture.asset(
                      kNotificaitonIcon,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Column(
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
                              child: Image.asset(
                                kSampleProductImage,
                                fit: BoxFit.cover,
                              ),
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
                              child: Center(
                                child: SvgPicture.asset(
                                  kSaveIcon,
                                  width: 20,
                                  height: 20,
                                  colorFilter: const ColorFilter.mode(
                                    kPrimaryColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).pOnly(top: 20),
                    Text(
                      'Regular Fit Slogan',
                      style: textBody1SemiBold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ).py(8),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            kStarIcon,
                            width: 18,
                            height: 18,
                          ),
                        ),
                        const SizedBox(width: 6),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '4.0/5',
                                style: textBody2SemiBold.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: ' (45 reviews)',
                                style: textBody2.copyWith(color: kGrey600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'The name says it all, the right size slightly snugs '
                      'the body leaving enough room for comfort in the '
                      'sleeves and waist.The name says it all, the right size slightly snugs '
                      'the body leaving enough room for comfort in the '
                      'sleeves and waist.',
                      style: textBody2.copyWith(color: kGrey600),
                    ).py(16),
                    Text(kChooseSizeLabel, style: textBody1SemiBold).py(12),
                    Row(
                      children: [
                        for (final size in _sizes) ...[
                          GestureDetector(
                            onTap: () => setState(() => _selectedSize = size),
                            child: Container(
                              width: 48,
                              height: 48,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: _selectedSize == size
                                      ? kPrimaryColor
                                      : kGrey300,
                                  width: _selectedSize == size ? 1.5 : 1,
                                ),
                              ),
                              child: Text(size, style: textBody1SemiBold),
                            ),
                          ),
                          const SizedBox(width: 12),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 1, color: kGrey200),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kPriceLabel,
                        style: textBody2.copyWith(color: kGrey500),
                      ),
                      Text('\$ 1,190', style: textHeader4),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        minimumSize: const Size(double.infinity, 54),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            kBagIcon,
                            height: 24,
                            width: 24,
                          ).px(8),

                          Text(
                            kAddToCartText,
                            style: textBody1SemiBold.copyWith(
                              color: kWhiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
