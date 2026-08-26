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
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _nameTouched = false;
  bool _emailTouched = false;
  bool _passwordTouched = false;

  late final TapGestureRecognizer _loginRecognizer = TapGestureRecognizer()
    ..onTap = () => context.router.push(const SigninRoute());

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _loginRecognizer.dispose();
    super.dispose();
  }

  AuthFieldStatus get _nameStatus {
    if (!_nameTouched) return AuthFieldStatus.neutral;
    return isValidFullName(_nameController.text)
        ? AuthFieldStatus.success
        : AuthFieldStatus.error;
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
      _nameStatus == AuthFieldStatus.success &&
      _emailStatus == AuthFieldStatus.success &&
      _passwordStatus == AuthFieldStatus.success;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(kSignupTitle, style: textHeader3).py(8),
              Text(kSignupSubtitle, style: textBody1.copyWith(color: kGrey500)),
              AuthTextField(
                label: kFullNameLabel,
                hint: kFullNameHint,
                controller: _nameController,
                status: _nameStatus,
                errorText: kFullNameError,
                onChanged: (_) => setState(() => _nameTouched = true),
              ).py(24),

              AuthTextField(
                label: kEmailLabel,
                hint: kEmailHint,
                controller: _emailController,
                status: _emailStatus,
                errorText: kEmailInvalidError,
                keyboardType: TextInputType.emailAddress,
                onChanged: (_) => setState(() => _emailTouched = true),
              ),

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
              ).py(24),

              Text.rich(
                TextSpan(
                  style: textBody3,
                  children: const [
                    TextSpan(text: kSignupTermsIntro),
                    TextSpan(
                      text: kTermsText,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(text: kCommaSeparator),
                    TextSpan(
                      text: kPrivacyPolicyText,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(text: kCommaAndText),
                    TextSpan(
                      text: kUsedCookieText,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isFormValid ? () {} : null,
                style: ElevatedButton.styleFrom(
                  textStyle: textBody2Medium,
                  backgroundColor: kPrimaryColor,
                  disabledBackgroundColor: kGrey300,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  kCreateAccountButtonText,
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
                label: kGoogleSignupText,
                backgroundColor: kWhiteColor,
                textColor: kPrimaryColor,
                borderColor: kGrey300,
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              SocialAuthButton(
                iconAsset: kfacebookIcon,
                label: kFacebookSignupText,
                backgroundColor: kFacebookColor,
                textColor: kWhiteColor,
                onPressed: () {},
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    style: textBody2.copyWith(color: kGrey700),
                    children: [
                      TextSpan(text: kAlreadyHaveAccountText),
                      TextSpan(
                        recognizer: _loginRecognizer,
                        text: kLogInText,
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ).py(25),
            ],
          ),
        ),
      ),
    );
  }
}
