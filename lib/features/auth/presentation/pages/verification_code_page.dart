import 'package:auto_route/auto_route.dart';
import 'package:ecommerceapp/config/routes/routes.dart';
import 'package:ecommerceapp/core/utils/color.dart';
import 'package:ecommerceapp/core/utils/extension.dart';
import 'package:ecommerceapp/core/utils/string.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key, required this.email});

  final String email;

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: textHeader3,
      decoration: BoxDecoration(
        border: Border.all(color: kGrey300),
        borderRadius: BorderRadius.circular(12),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: kPrimaryColor, width: 1.5),
    );
    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: kPrimaryColor),
    );

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
                    Text(kVerificationTitle, style: textHeader3).py(8),
                    Text.rich(
                      TextSpan(
                        style: textBody1.copyWith(color: kGrey500),
                        children: [
                          const TextSpan(text: kVerificationSubtitlePrefix),
                          TextSpan(
                            text: widget.email,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const TextSpan(text: kVerificationSubtitleSuffix),
                        ],
                      ),
                    ),
                    Center(
                      child: Pinput(
                        length: 4,
                        controller: _pinController,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        separatorBuilder: (index) => const SizedBox(width: 16),
                        onChanged: (_) => setState(() {}),
                      ),
                    ).py(24),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          style: textBody2.copyWith(color: kGrey700),
                          children: const [
                            TextSpan(text: kEmailNotReceivedText),
                            TextSpan(
                              text: kResendCodeText,
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).py(12),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: ElevatedButton(
                onPressed: _pinController.text.length == 4
                    ? () => context.router.push(const ResetPasswordRoute())
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
