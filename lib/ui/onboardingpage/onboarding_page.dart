import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _logoImage = 'https://img.icons8.com/color/452/firebase.png';
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image.network(
              _logoImage,
              width: OneContext.instance.context!.size!.width / 2,
            ),
          ],
        ),
      ),
    );
  }
}
