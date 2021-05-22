import 'package:flutter/material.dart';
import 'package:fluttertest/constants.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    Key? key,
    required GlobalKey<FormFieldState> phoneFormKey,
    required this.phone,
  })  : _phoneFormKey = phoneFormKey,
        super(key: key);

  final GlobalKey<FormFieldState> _phoneFormKey;
  final TextEditingController phone;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _phoneFormKey,
      controller: phone,
      keyboardType: TextInputType.phone,
      validator: (value) {
        final limit = Constants.phoneNumberLimit;
        if (value == '') {
          return 'Please enter a valid phone number';
        } else if (value!.length != limit) {
          return 'Phone number must be 10 numbers';
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 30, top: 20, bottom: 20),
        hintText: 'Enter your phone number',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
