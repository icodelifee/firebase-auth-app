import 'package:flutter/material.dart';

class OTPTextField extends StatelessWidget {
  const OTPTextField({
    Key? key,
    required GlobalKey<FormFieldState> otpFormKey,
    required this.otp,
  })  : _otpFormKey = otpFormKey,
        super(key: key);

  final GlobalKey<FormFieldState> _otpFormKey;
  final TextEditingController otp;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _otpFormKey,
      controller: otp,
      validator: (val) {
        if (val == '') {
          return 'Please enter a valid OTP';
        } else if (val!.length != 6) {
          return 'OTP is 6 digits long';
        }
      },
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 30, top: 20, bottom: 20),
        hintText: 'Enter OTP',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
