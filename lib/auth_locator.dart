import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertest/data/providers/auth_listener_provider.dart';
import 'package:fluttertest/ui/homepage/home_page.dart';
import 'package:fluttertest/ui/onboardingpage/onboarding_page.dart';
import 'package:fluttertest/ui/widgets/auth_locator_loading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthLocator extends HookWidget {
  const AuthLocator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(authListenerProvider);
    // this widget handles auth changes listener
    return provider.when(
        data: (data) {
          if (data?.uid != null) {
            return HomePage();
          } else {
            return OnBoardingPage();
          }
        },
        loading: () => AuthLocatorLoading(),
        error: (error, stackTrace) => OnBoardingPage());
  }
}
