import 'package:ecommerceapp/core/utils/color.dart';
import 'package:ecommerceapp/core/utils/extension.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoResultFounde extends StatelessWidget {
  const NoResultFounde({
    super.key,
    required this.noReslutFounText,
    required this.noResultFoundDescription,
    required this.image,
  });

  final String noReslutFounText;
  final String noResultFoundDescription;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .center,
      mainAxisAlignment: .center,
      children: [
        SvgPicture.asset(image, height: 40, width: 40).py(10),
        Text(
          textAlign: .center,
          maxLines: 1,
          noReslutFounText,
          style: textBody1SemiBold,
        ).py(10),
        Text(
          maxLines: 1,
          textAlign: .center,
          noResultFoundDescription,
          style: textBody1.copyWith(color: kGrey300),
        ),
      ],
    );
  }
}
