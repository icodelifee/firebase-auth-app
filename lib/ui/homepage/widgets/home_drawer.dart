import 'package:flutter/material.dart';
import 'package:fluttertest/data/providers/firebase_auth_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const Spacer(),
          const Divider(),
          ListTile(
            onTap: () async {
              await Future.wait([
                context.read(firebaseAuthProvider).signOut(),
                GoogleSignIn().signOut()
              ]);
            },
            title: const Text('Logout'),
          )
        ],
      ),
    );
  }
}
