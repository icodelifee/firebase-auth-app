import 'package:flutter/material.dart';

class AuthLocatorLoading extends StatelessWidget {
  const AuthLocatorLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
