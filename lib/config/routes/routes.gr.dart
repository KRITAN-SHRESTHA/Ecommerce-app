// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingPage();
    },
  );
}

/// generated route for
/// [ResetPasswordPage]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute({List<PageRouteInfo>? children})
    : super(ResetPasswordRoute.name, initialChildren: children);

  static const String name = 'ResetPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ResetPasswordPage();
    },
  );
}

/// generated route for
/// [SigninPage]
class SigninRoute extends PageRouteInfo<void> {
  const SigninRoute({List<PageRouteInfo>? children})
    : super(SigninRoute.name, initialChildren: children);

  static const String name = 'SigninRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SigninPage();
    },
  );
}

/// generated route for
/// [SignupPage]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute({List<PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignupPage();
    },
  );
}

/// generated route for
/// [VerificationCodePage]
class VerificationCodeRoute extends PageRouteInfo<VerificationCodeRouteArgs> {
  VerificationCodeRoute({
    Key? key,
    required String email,
    List<PageRouteInfo>? children,
  }) : super(
         VerificationCodeRoute.name,
         args: VerificationCodeRouteArgs(key: key, email: email),
         initialChildren: children,
       );

  static const String name = 'VerificationCodeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerificationCodeRouteArgs>();
      return VerificationCodePage(key: args.key, email: args.email);
    },
  );
}

class VerificationCodeRouteArgs {
  const VerificationCodeRouteArgs({this.key, required this.email});

  final Key? key;

  final String email;

  @override
  String toString() {
    return 'VerificationCodeRouteArgs{key: $key, email: $email}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VerificationCodeRouteArgs) return false;
    return key == other.key && email == other.email;
  }

  @override
  int get hashCode => key.hashCode ^ email.hashCode;
}
