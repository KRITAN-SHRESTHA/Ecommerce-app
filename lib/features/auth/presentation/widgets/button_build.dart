import 'package:ecommerceapp/core/utils/color.dart';
import 'package:ecommerceapp/core/utils/extension.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildButton extends StatelessWidget {
  const BuildButton({
    super.key,
    required this.image,
    required this.kAddToCartText,
    required this.onTap,
  });

  final VoidCallback? onTap;
  final String image;
  final String kAddToCartText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        minimumSize: const Size(double.infinity, 54),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image, height: 24, width: 24).px(8),

          Text(
            kAddToCartText,
            style: textBody1SemiBold.copyWith(color: kWhiteColor),
          ),
        ],
      ),
    );
  }
}
