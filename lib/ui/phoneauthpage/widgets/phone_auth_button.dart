import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertest/ui/phoneauthpage/phone_auth_viewmodel.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_context/one_context.dart';

import '../../../constants.dart';

class PhoneAuthButton extends HookWidget {
  const PhoneAuthButton({
    Key? key,
    required GlobalKey<FormFieldState> phoneFormKey,
    required GlobalKey<FormFieldState> otpFormKey,
    required this.phone,
    required this.otp,
  })  : _phoneFormKey = phoneFormKey,
        _otpFormKey = otpFormKey,
        super(key: key);

  final GlobalKey<FormFieldState> _phoneFormKey;
  final GlobalKey<FormFieldState> _otpFormKey;
  final TextEditingController phone;
  final TextEditingController otp;

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(phoneAuthViewProvider);
    return MaterialButton(
        onPressed: () async {
          OneContext().focusScope.unfocus();
          provider.isLoading = true;

          // if OTP is false then its get OTP mode
          if (!provider.isOTP) {
            if (_phoneFormKey.currentState!.validate()) {
              await provider.getOTP(Constants.countryCode + phone.text);
            }
          } else {
            if (_otpFormKey.currentState!.validate()) {
              await provider.submitOTP(otp.text, context);
            }
          }
        },
        minWidth: OneContext().mediaQuery.size.width / 1.1,
        height: 60,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: Colors.green,
        child: !provider.isLoading
            ? (!provider.isOTP
                ? _buttonChild('Get OTP', Icons.lock_outline)
                : _buttonChild('Submit OTP', Icons.login))
            : CircularProgressIndicator(
                color: Colors.white,
              ));
  }

  Row _buttonChild(String text, IconData icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Gap(10),
        Icon(
          icon,
          color: Colors.white,
        )
      ],
    );
  }
}
