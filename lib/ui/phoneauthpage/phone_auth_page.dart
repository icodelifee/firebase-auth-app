import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertest/ui/phoneauthpage/widgets/otp_text_field.dart';
import 'package:fluttertest/ui/phoneauthpage/widgets/phone_auth_button.dart';
import 'package:fluttertest/ui/phoneauthpage/widgets/phone_text_field.dart';
import 'package:fluttertest/ui/widgets/onboarding_logo.dart';
import 'package:gap/gap.dart';

class PhoneAuthPage extends HookWidget {
  PhoneAuthPage({Key? key}) : super(key: key);
  final _phoneFormKey = GlobalKey<FormFieldState>();
  final _otpFormKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    final phone = useTextEditingController();
    final otp = useTextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OnboardingLogo(),
              Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Authenticate With Phone',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 19,
                      ),
                    ),
                    Gap(20),
                    PhoneTextField(phoneFormKey: _phoneFormKey, phone: phone),
                    Gap(15),
                    OTPTextField(otpFormKey: _otpFormKey, otp: otp),
                    Gap(15),
                    PhoneAuthButton(
                      phoneFormKey: _phoneFormKey,
                      otpFormKey: _otpFormKey,
                      otp: otp,
                      phone: phone,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
