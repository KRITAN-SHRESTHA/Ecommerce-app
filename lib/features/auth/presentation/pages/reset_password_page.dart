import 'package:auto_route/auto_route.dart';
import 'package:ecommerceapp/config/routes/routes.dart';
import 'package:ecommerceapp/core/utils/color.dart';
import 'package:ecommerceapp/core/utils/extension.dart';
import 'package:ecommerceapp/core/utils/string.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:ecommerceapp/features/auth/domain/usecases/auth_validators.dart';
import 'package:ecommerceapp/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _passwordTouched = false;
  bool _confirmPasswordTouched = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  AuthFieldStatus get _passwordStatus {
    if (!_passwordTouched) return AuthFieldStatus.neutral;
    return isValidPassword(_passwordController.text)
        ? AuthFieldStatus.success
        : AuthFieldStatus.error;
  }

  AuthFieldStatus get _confirmPasswordStatus {
    if (!_confirmPasswordTouched) return AuthFieldStatus.neutral;
    return doPasswordsMatch(
          _passwordController.text,
          _confirmPasswordController.text,
        )
        ? AuthFieldStatus.success
        : AuthFieldStatus.error;
  }

  String get _confirmPasswordErrorText =>
      _confirmPasswordController.text.isEmpty
      ? kPasswordError
      : kPasswordMismatchError;

  bool get _isFormValid =>
      _passwordStatus == AuthFieldStatus.success &&
      _confirmPasswordStatus == AuthFieldStatus.success;

  void _showSuccessDialog() {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: kSuccessColor, width: 2),
                ),
                child: const Icon(Icons.check, color: kSuccessColor, size: 32),
              ).py(16),
              Text(
                kPasswordChangedTitle,
                style: textBody1SemiBold,
                textAlign: TextAlign.center,
              ).py(8),
              Text(
                kPasswordChangedSubtitle,
                style: textBody2.copyWith(color: kGrey700),
                textAlign: TextAlign.center,
              ).py(16),
              ElevatedButton(
                onPressed: () =>
                    dialogContext.router.replaceAll([const SigninRoute()]),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  minimumSize: const Size(double.infinity, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  kLoginButtonText,
                  style: textBody1SemiBold.copyWith(color: kWhiteColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => context.router.maybePop(),
                      child: const Icon(Icons.arrow_back),
                    ).py(16),
                    Text(kResetPasswordTitle, style: textHeader3).py(8),
                    Text(
                      kResetPasswordSubtitle,
                      style: textBody1.copyWith(color: kGrey500),
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
                    ).py(20),
                    AuthTextField(
                      label: kPasswordLabel,
                      hint: kPasswordHint,
                      controller: _confirmPasswordController,
                      status: _confirmPasswordStatus,
                      errorText: _confirmPasswordErrorText,
                      obscureText: _obscureConfirmPassword,
                      showObscureToggle: true,
                      onToggleObscure: () => setState(
                        () =>
                            _obscureConfirmPassword = !_obscureConfirmPassword,
                      ),
                      onChanged: (_) =>
                          setState(() => _confirmPasswordTouched = true),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: ElevatedButton(
                onPressed: _isFormValid ? _showSuccessDialog : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  disabledBackgroundColor: kGrey300,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  kContinueButtonText,
                  style: textBody1SemiBold.copyWith(color: kWhiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
