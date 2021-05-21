import 'package:flutter/material.dart';
import 'package:fluttertest/ui/homepage/home_page.dart';
import 'package:fluttertest/ui/onboardingpage/widgets/onboarding_logo.dart';
import 'package:fluttertest/ui/onboardingpage/widgets/signin_button.dart';
import 'package:gap/gap.dart';
import 'package:one_context/one_context.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _logoImage = 'https://img.icons8.com/color/452/firebase.png';
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: OneContext().mediaQuery.size.height,
          width: OneContext().mediaQuery.size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OnboardingLogo(logoImage: _logoImage),
              Column(
                children: [
                  SignInButton(
                    text: 'Google',
                    buttonColor: Colors.blue,
                    route: HomePage(),
                  ),
                  Gap(15),
                  SignInButton(
                    text: 'Phone',
                    buttonColor: Colors.green,
                    icon: Icons.phone,
                    route: HomePage(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
