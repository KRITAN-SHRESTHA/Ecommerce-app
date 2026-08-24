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
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  bool _emailTouched = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  AuthFieldStatus get _emailStatus {
    if (!_emailTouched) return AuthFieldStatus.neutral;
    return isValidEmail(_emailController.text)
        ? AuthFieldStatus.success
        : AuthFieldStatus.error;
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
                    Text(kForgotPasswordTitle, style: textHeader3).py(8),
                    Text(
                      kForgotPasswordSubtitle,
                      style: textBody1.copyWith(color: kGrey500),
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
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: ElevatedButton(
                onPressed: _emailStatus == AuthFieldStatus.success
                    ? () => context.router.push(
                        VerificationCodeRoute(email: _emailController.text),
                      )
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  disabledBackgroundColor: kGrey300,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  kSendCodeButtonText,
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
