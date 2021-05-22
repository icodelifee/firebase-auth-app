import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_context/one_context.dart';

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget({Key? key, required this.error}) : super(key: key);
  final Object error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline_outlined,
                color: Colors.red,
                size: OneContext().mediaQuery.size.width / 4,
              ),
              Gap(20),
              Text(
                error.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
