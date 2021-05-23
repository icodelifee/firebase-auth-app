import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class OnboardingLogo extends StatelessWidget {
  const OnboardingLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/firebase.png',
      width: OneContext().mediaQuery.size.width / 2,
    );
  }
}
