import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class OnboardingLogo extends StatelessWidget {
  const OnboardingLogo({
    Key? key,
    required String logoImage,
  })  : _logoImage = logoImage,
        super(key: key);

  final String _logoImage;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      _logoImage,
      width: OneContext().mediaQuery.size.width / 2,
      alignment: Alignment.center,
    );
  }
}
