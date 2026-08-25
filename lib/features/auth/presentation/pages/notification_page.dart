import 'package:auto_route/auto_route.dart';
import 'package:ecommerceapp/core/utils/assets.dart';
import 'package:ecommerceapp/core/utils/color.dart';
import 'package:ecommerceapp/core/utils/extension.dart';
import 'package:ecommerceapp/core/utils/string.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class NotificaitonPage extends StatefulWidget {
  const NotificaitonPage({super.key});

  @override
  State<NotificaitonPage> createState() => _NotificaitonPageState();
}

class _NotificaitonPageState extends State<NotificaitonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: .all(24),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => context.router.maybePop(),
                    child: Icon(Icons.arrow_back),
                  ),
                  Text(kNotificationText, style: textHeader4),
                  SvgPicture.asset(kNotificaitonIcon),
                ],
              ),
              const Divider(color: kGrey200, thickness: 0.5).py(20),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              "Today",
                              style: textBody1SemiBold,
                            ).pOnly(bottom: 15),
                            Row(
                              crossAxisAlignment: .center,

                              children: [
                                SvgPicture.asset(
                                  kDiscountIcon,
                                  width: 28,
                                  height: 28,
                                ),
                                Column(
                                  crossAxisAlignment: .start,
                                  mainAxisAlignment: .center,
                                  children: [
                                    Text(
                                      "30% Special Discount!",
                                      style: textBody1SemiBold,
                                    ),
                                    Text(
                                      "Special promotion only valid today.",
                                      style: textBody2.copyWith(
                                        color: kGrey400,
                                      ),
                                    ),
                                  ],
                                ).pOnly(left: 10),
                              ],
                            ),
                            const Divider(
                              color: kGrey200,
                              thickness: 0.5,
                            ).py(20),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              "Today",
                              style: textBody1SemiBold,
                            ).pOnly(bottom: 15),
                            Row(
                              crossAxisAlignment: .center,

                              children: [
                                SvgPicture.asset(
                                  kWalletIcon,
                                  width: 28,
                                  height: 28,
                                ),
                                Column(
                                  crossAxisAlignment: .start,
                                  mainAxisAlignment: .center,
                                  children: [
                                    Text(
                                      "30% Special Discount!",
                                      style: textBody1SemiBold,
                                    ),
                                    Text(
                                      "Special promotion only valid today.",
                                      style: textBody2.copyWith(
                                        color: kGrey400,
                                      ),
                                    ),
                                  ],
                                ).pOnly(left: 10),
                              ],
                            ),
                            const Divider(
                              color: kGrey200,
                              thickness: 0.5,
                              indent: 38,
                            ).py(15),
                            Row(
                              crossAxisAlignment: .center,

                              children: [
                                SvgPicture.asset(
                                  kLocationIcon,
                                  width: 28,
                                  height: 28,
                                ),
                                Column(
                                  crossAxisAlignment: .start,
                                  mainAxisAlignment: .center,
                                  children: [
                                    Text(
                                      "30% Special Discount!",
                                      style: textBody1SemiBold,
                                    ),
                                    Text(
                                      "Special promotion only valid today.",
                                      style: textBody2.copyWith(
                                        color: kGrey400,
                                      ),
                                    ),
                                  ],
                                ).pOnly(left: 10),
                              ],
                            ),
                            const Divider(
                              color: kGrey200,
                              thickness: 0.5,
                            ).py(20),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
