import 'package:auto_route/auto_route.dart';
import 'package:ecommerceapp/features/auth/presentation/pages/onboarding_page.dart';
import 'package:ecommerceapp/features/auth/presentation/pages/signin_page.dart';
import 'package:ecommerceapp/features/auth/presentation/pages/signup_page.dart';

part 'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // AutoRoute(
    //   path: '/dashboard',
    //   page: DashboardRoute.page,
    //   // initial: true,
    //   children: [
    //     AutoRoute(path: 'home', page: HomeRoute.page, initial: true),
    //     AutoRoute(path: 'offernews', page: OfferRoute.page),
    //     AutoRoute(path: 'brand', page: BrandRoute.page),
    //     AutoRoute(path: 'profile', page: ProfileRoute.page),
    //   ],
    // ),
    AutoRoute(initial: true, keepHistory: true, page: OnboardingRoute.page),
    AutoRoute(page: SignupRoute.page),
    AutoRoute(page: SigninRoute.page),
  ];
}
