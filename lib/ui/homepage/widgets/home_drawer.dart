import 'package:flutter/material.dart';
import 'package:fluttertest/data/providers/firebase_auth_provider.dart';
import 'package:fluttertest/ui/homepage/homepage_viewmodel.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);
  final _defaultImage = 'https://del.dog/arelebi';
  @override
  Widget build(BuildContext context) {
    final user = context.read(firebaseAuthProvider).currentUser!;
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                  backgroundImage:
                      NetworkImage(user.photoURL ?? _defaultImage)),
              decoration: BoxDecoration(color: Colors.red),
              accountName: Text(
                user.displayName ?? user.phoneNumber!,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              accountEmail: Text('UID: ${user.uid}')),
          const Spacer(),
          const Divider(),
          ListTile(
            onTap: () async {
              await Future.wait([
                context.read(firebaseAuthProvider).signOut(),
                GoogleSignIn().signOut()
              ]);
              // reset the providers;
              context.refresh(homePageViewProvider);
              await context.refresh(restaurantProvider);
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Logout',
                  style: TextStyle(fontSize: 16),
                ),
                Icon(Icons.logout)
              ],
            ),
          )
        ],
      ),
    );
  }
}
