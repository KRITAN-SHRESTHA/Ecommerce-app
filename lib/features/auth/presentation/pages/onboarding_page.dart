import 'package:auto_route/auto_route.dart';
import 'package:ecommerceapp/config/routes/routes.dart';
import 'package:ecommerceapp/core/utils/assets.dart';
import 'package:ecommerceapp/core/utils/color.dart';
import 'package:ecommerceapp/core/utils/extension.dart';
import 'package:ecommerceapp/core/utils/string.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  FractionallySizedBox(
                    heightFactor: 1,
                    widthFactor: 1,
                    child: Image.asset(
                      kOnboardingImage,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Positioned(
                    top: 24,
                    left: 24,
                    right: 4,
                    child: Text(kOnboardingTitle, style: textHeader1),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 22, 24, 31),
              child: ElevatedButton(
                onPressed: () {
                  context.router.push(const SignupRoute());
                },
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
                    Text(
                      kOnboardingButtonText,
                      style: textBody1Medium.copyWith(color: kWhiteColor),
                    ).px(10),

                    const Icon(Icons.arrow_forward, color: kWhiteColor),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
