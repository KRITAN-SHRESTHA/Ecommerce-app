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
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(kAccountText, style: textHeader4),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.router.push(NotificaitonRoute()),
                    child: SvgPicture.asset(kNotificaitonIcon),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      child: const Divider(thickness: 0.2),
                    ),
                    BuildAccount(
                      image: kOrderIcon,
                      name: kMyOrderText,
                      onTap: () {},
                    ),
                    Container(
                      decoration: const BoxDecoration(color: kGrey200),
                      height: 7,
                      width: double.infinity,
                    ),
                    BuildAccount(
                      image: kDetailIcon,
                      name: kMyDetailsText,
                      onTap: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      child: const Divider(thickness: 0.2, endIndent: 8),
                    ),
                    BuildAccount(
                      image: kAddressIcon,
                      name: kAddressBookText,
                      onTap: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      child: const Divider(thickness: 0.2, endIndent: 8),
                    ),
                    BuildAccount(
                      image: kCardIcon,
                      name: kPaymentMethodsText,
                      onTap: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      child: const Divider(thickness: 0.2, endIndent: 8),
                    ),
                    BuildAccount(
                      image: kNotificaitonIcon,
                      name: kNotificaitonsText,
                      onTap: () => context.router.push(NotificaitonRoute()),
                    ),
                    Container(
                      decoration: const BoxDecoration(color: kGrey200),
                      height: 7,
                      width: double.infinity,
                    ),
                    BuildAccount(
                      image: kQuestionIcon,
                      name: kFAQsText,
                      onTap: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      child: const Divider(thickness: 0.2, endIndent: 8),
                    ),
                    BuildAccount(
                      image: kHeadPhoneIcon,
                      name: kHelpCenterText,
                      onTap: () {},
                    ),
                    Container(
                      decoration: const BoxDecoration(color: kGrey200),
                      height: 7,
                      width: double.infinity,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              kLogOutIcon,
                              width: 20,
                              height: 20,
                              colorFilter: const ColorFilter.mode(
                                kErrorColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            Text(
                              kLogOutText,
                              style: textBody2.copyWith(color: kErrorColor),
                            ).pOnly(left: 8),
                          ],
                        ),
                      ),
                    ),
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

class BuildAccount extends StatelessWidget {
  const BuildAccount({
    super.key,
    required this.image,
    required this.name,
    required this.onTap,
  });

  final String image;
  final String name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 10, 24, 9),
        child: SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Row(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                children: [
                  SvgPicture.asset(image, width: 20, height: 20),
                  Text(name, style: textBody2).pOnly(left: 8),
                ],
              ),
              SvgPicture.asset(kArrowRightIcon, width: 20, height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
