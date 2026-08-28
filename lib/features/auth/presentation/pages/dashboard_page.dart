import 'package:auto_route/auto_route.dart';
import 'package:ecommerceapp/config/routes/routes.dart';
import 'package:ecommerceapp/core/utils/assets.dart';
import 'package:ecommerceapp/core/utils/color.dart';
import 'package:ecommerceapp/core/utils/string.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        SearchRoute(),
        FavouriteRoute(),
        CartRoute(),
        AccountRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: kWhiteColor,
              border: Border(top: BorderSide(color: kGrey200)),
            ),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    _NavItem(
                      asset: kHomeIcon,
                      label: kHomeLabel,
                      selected: tabsRouter.activeIndex == 0,
                      onTap: () => tabsRouter.setActiveIndex(0),
                    ),
                    _NavItem(
                      asset: kSearchIcon,
                      label: kSearchLabel,
                      selected: tabsRouter.activeIndex == 1,
                      onTap: () => tabsRouter.setActiveIndex(1),
                    ),
                    _NavItem(
                      asset: kSaveIcon,
                      label: kSavedLabel,
                      selected: tabsRouter.activeIndex == 2,
                      onTap: () => tabsRouter.setActiveIndex(2),
                    ),
                    _NavItem(
                      asset: kCartIcon,
                      label: kCartLabel,
                      selected: tabsRouter.activeIndex == 3,
                      onTap: () => tabsRouter.setActiveIndex(3),
                    ),
                    _NavItem(
                      asset: kUserIcon,
                      label: kAccountLabel,
                      selected: tabsRouter.activeIndex == 4,
                      onTap: () => tabsRouter.setActiveIndex(4),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.asset,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String asset;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? kPrimaryColor : kGrey400;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 14),
              decoration: BoxDecoration(
                color: selected ? kGrey200 : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: SvgPicture.asset(
                asset,
                width: 22,
                height: 22,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: (selected ? textBody3SemiBold : textBody3).copyWith(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
