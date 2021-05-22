import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class OnboardingLogo extends StatelessWidget {
  const OnboardingLogo({
    Key? key,
  }) : super(key: key);

  final String _logoImage = 'https://img.icons8.com/color/452/firebase.png';

  @override
  Widget build(BuildContext context) {
    return Image.network(
      _logoImage,
      width: OneContext().mediaQuery.size.width / 2,
    );
  }
}
