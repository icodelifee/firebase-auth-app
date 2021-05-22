import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertest/data/providers/auth_repository_provider.dart';
import 'package:gap/gap.dart';
import 'package:one_context/one_context.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInButton extends HookWidget {
  const SignInButton({
    required this.text,
    required this.buttonColor,
    this.icon,
    this.iconImage = 'https://img.icons8.com/color/452/google-logo.png',
    required this.route,
    required this.isGoogleAuth,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color buttonColor;
  final Widget route;
  final IconData? icon;
  final String iconImage;
  final bool isGoogleAuth;

  @override
  Widget build(BuildContext context) {
    final loading = useValueNotifier(false);
    return ValueListenableBuilder(
      valueListenable: loading,
      builder: (context, value, child) => MaterialButton(
        onPressed: () => _signIn(loading, context),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: buttonColor,
        height: 70,
        child: SizedBox(
          width: OneContext().mediaQuery.size.width / 1.3,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: value != null
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (icon == null)
                        ImageIcon(
                          NetworkImage(iconImage),
                          size: 25,
                          color: Colors.white,
                        )
                      else
                        Icon(
                          icon,
                          color: Colors.white,
                        ),
                      Text(
                        text,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Gap(10)
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  void _signIn(ValueNotifier<bool> loading, BuildContext context) {
    loading.value = true;
    if (isGoogleAuth) {
      final auth = context.read(authRespositoryProvider);
      auth.signInWithGoogle().then((value) {
        // push and remove all previous routes to homepage
        // OneContext().pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (_) => route), (route) => false);
        // commented out because it messes up the auth listener
      }).catchError((err) {
        if (err.runtimeType == FirebaseAuthException) {
          OneContext().showSnackBar(
            builder: (_) => SnackBar(
              duration: Duration(seconds: 2),
              content: Text(err.message),
            ),
          );
        }
      });
    } else {
      OneContext().push(MaterialPageRoute(builder: (_) => route));
    }
    loading.value = false;
  }
}
