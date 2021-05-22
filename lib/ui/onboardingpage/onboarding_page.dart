import 'package:flutter/material.dart';
import 'package:fluttertest/ui/homepage/home_page.dart';
import 'package:fluttertest/ui/widgets/onboarding_logo.dart';
import 'package:fluttertest/ui/onboardingpage/widgets/signin_button.dart';
import 'package:fluttertest/ui/phoneauthpage/phone_auth_page.dart';
import 'package:gap/gap.dart';
import 'package:one_context/one_context.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: OneContext().mediaQuery.size.height,
          width: OneContext().mediaQuery.size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OnboardingLogo(),
              Column(
                children: [
                  SignInButton(
                    text: 'Google',
                    buttonColor: Colors.blue,
                    route: HomePage(),
                    isGoogleAuth: true,
                  ),
                  Gap(15),
                  SignInButton(
                      text: 'Phone',
                      buttonColor: Colors.green,
                      icon: Icons.phone,
                      route: PhoneAuthPage(),
                      isGoogleAuth: false),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
