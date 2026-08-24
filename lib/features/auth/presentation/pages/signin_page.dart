import 'package:auto_route/auto_route.dart';
import 'package:ecommerceapp/config/routes/routes.dart';
import 'package:ecommerceapp/core/utils/assets.dart';
import 'package:ecommerceapp/core/utils/color.dart';
import 'package:ecommerceapp/core/utils/extension.dart';
import 'package:ecommerceapp/core/utils/string.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:ecommerceapp/features/auth/domain/usecases/auth_validators.dart';
import 'package:ecommerceapp/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:ecommerceapp/features/auth/presentation/widgets/social_auth_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _emailTouched = false;
  bool _passwordTouched = false;

  late final TapGestureRecognizer _signUpRecognizer = TapGestureRecognizer()
    ..onTap = () => context.router.push(const SignupRoute());

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _signUpRecognizer.dispose();
    super.dispose();
  }

  AuthFieldStatus get _emailStatus {
    if (!_emailTouched) return AuthFieldStatus.neutral;
    return isValidEmail(_emailController.text)
        ? AuthFieldStatus.success
        : AuthFieldStatus.error;
  }

  AuthFieldStatus get _passwordStatus {
    if (!_passwordTouched) return AuthFieldStatus.neutral;
    return isValidPassword(_passwordController.text)
        ? AuthFieldStatus.success
        : AuthFieldStatus.error;
  }

  bool get _isFormValid =>
      _emailStatus == AuthFieldStatus.success &&
      _passwordStatus == AuthFieldStatus.success;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(kLoginTitle, style: textHeader2).py(8),
              Text(kLoginSubtitle, style: textBody1.copyWith(color: kGrey500)),
              AuthTextField(
                label: kEmailLabel,
                hint: kEmailHint,
                controller: _emailController,
                status: _emailStatus,
                errorText: kEmailInvalidError,
                keyboardType: TextInputType.emailAddress,
                onChanged: (_) => setState(() => _emailTouched = true),
              ).py(24),
              AuthTextField(
                label: kPasswordLabel,
                hint: kPasswordHint,
                controller: _passwordController,
                status: _passwordStatus,
                errorText: kPasswordError,
                obscureText: _obscurePassword,
                showObscureToggle: true,
                onToggleObscure: () =>
                    setState(() => _obscurePassword = !_obscurePassword),
                onChanged: (_) => setState(() => _passwordTouched = true),
              ),
              const SizedBox(height: 12),
              Text.rich(
                TextSpan(
                  style: textBody3.copyWith(color: kGrey700),
                  children: const [
                    TextSpan(text: kForgotPasswordText),
                    TextSpan(
                      text: kResetPasswordText,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isFormValid ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  disabledBackgroundColor: kGrey300,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  kLoginButtonText,
                  style: textBody1SemiBold.copyWith(color: kWhiteColor),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(child: Divider(color: kGrey300)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      kOrText,
                      style: textBody2.copyWith(color: kGrey600),
                    ),
                  ),
                  Expanded(child: Divider(color: kGrey300)),
                ],
              ),
              const SizedBox(height: 24),
              SocialAuthButton(
                iconAsset: kgoogleIcon,
                label: kLoginWithGoogleText,
                backgroundColor: kWhiteColor,
                textColor: kPrimaryColor,
                borderColor: kGrey300,
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              SocialAuthButton(
                iconAsset: kfacebookIcon,
                label: kLoginWithFacebookText,
                backgroundColor: kFacebookColor,
                textColor: kWhiteColor,
                onPressed: () {},
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    style: textBody2.copyWith(color: kGrey700),
                    children: [
                      const TextSpan(text: kDontHaveAccountText),
                      TextSpan(
                        text: kJoinText,
                        recognizer: _signUpRecognizer,
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ).py(100),
            ],
          ),
        ),
      ),
    );
  }
}
