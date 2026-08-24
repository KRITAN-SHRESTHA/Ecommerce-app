import 'package:auto_route/auto_route.dart';
import 'package:ecommerceapp/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:ecommerceapp/features/auth/presentation/pages/onboarding_page.dart';
import 'package:ecommerceapp/features/auth/presentation/pages/reset_password_page.dart';
import 'package:ecommerceapp/features/auth/presentation/pages/signin_page.dart';
import 'package:ecommerceapp/features/auth/presentation/pages/signup_page.dart';
import 'package:ecommerceapp/features/auth/presentation/pages/verification_code_page.dart';
import 'package:ecommerceapp/features/auth/presentation/pages/account_page.dart';
import 'package:ecommerceapp/features/auth/presentation/pages/cart_page.dart';
import 'package:ecommerceapp/features/auth/presentation/pages/dashboard_page.dart';
import 'package:ecommerceapp/features/auth/presentation/pages/home_page.dart';
import 'package:ecommerceapp/features/auth/presentation/pages/saved_page.dart';
import 'package:ecommerceapp/features/auth/presentation/pages/search_page.dart';
import 'package:flutter/widgets.dart';

part 'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(initial: true, keepHistory: true, page: OnboardingRoute.page),
    AutoRoute(page: SignupRoute.page),
    AutoRoute(page: SigninRoute.page),
    AutoRoute(page: ForgotPasswordRoute.page),
    AutoRoute(page: VerificationCodeRoute.page),
    AutoRoute(page: ResetPasswordRoute.page),
    AutoRoute(
      page: DashboardRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: SavedRoute.page),
        AutoRoute(page: CartRoute.page),
        AutoRoute(page: AccountRoute.page),
      ],
    ),
  ];
}
