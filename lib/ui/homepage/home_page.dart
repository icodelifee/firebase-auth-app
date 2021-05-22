import 'package:flutter/material.dart';
import 'package:fluttertest/data/providers/firebase_auth_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () async {
              await context.read(firebaseAuthProvider).signOut();
              await GoogleSignIn().signOut();
            },
            child: Text('Logout'),
          ),
        ),
      ),
    );
  }
}
