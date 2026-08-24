import 'package:auto_route/auto_route.dart';
import 'package:ecommerceapp/config/routes/routes.dart';
import 'package:ecommerceapp/core/utils/assets.dart';
import 'package:ecommerceapp/core/utils/color.dart';
import 'package:ecommerceapp/core/utils/string.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        SearchRoute(),
        SavedRoute(),
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
            child: BottomNavigationBar(
              backgroundColor: kWhiteColor,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              currentIndex: tabsRouter.activeIndex,
              selectedItemColor: kPrimaryColor,
              unselectedItemColor: kGrey400,
              selectedLabelStyle: textBody3SemiBold,
              unselectedLabelStyle: textBody3,
              onTap: tabsRouter.setActiveIndex,
              items: [
                BottomNavigationBarItem(
                  label: kHomeLabel,
                  icon: _NavIcon(asset: kHomeIcon, selected: false),
                  activeIcon: _NavIcon(asset: kHomeIcon, selected: true),
                ),
                BottomNavigationBarItem(
                  label: kSearchLabel,
                  icon: _NavIcon(asset: kSearchIcon, selected: false),
                  activeIcon: _NavIcon(asset: kSearchIcon, selected: true),
                ),
                BottomNavigationBarItem(
                  label: kSavedLabel,
                  icon: _NavIcon(asset: kSaveIcon, selected: false),
                  activeIcon: _NavIcon(asset: kSaveIcon, selected: true),
                ),
                BottomNavigationBarItem(
                  label: kCartLabel,
                  icon: _NavIcon(asset: kCartIcon, selected: false),
                  activeIcon: _NavIcon(asset: kCartIcon, selected: true),
                ),
                BottomNavigationBarItem(
                  label: kAccountLabel,
                  icon: _NavIcon(asset: kUserIcon, selected: false),
                  activeIcon: _NavIcon(asset: kUserIcon, selected: true),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({required this.asset, required this.selected});

  final String asset;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: SvgPicture.asset(
        asset,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
          selected ? kPrimaryColor : kGrey400,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
