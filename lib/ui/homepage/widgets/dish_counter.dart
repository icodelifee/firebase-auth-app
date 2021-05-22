import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertest/ui/homepage/homepage_viewmodel.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DishCounter extends HookWidget {
  DishCounter({Key? key, required this.dishCounter}) : super(key: key);
  final DishQuantityCounter dishCounter;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.lightGreen,
      ),
      padding: EdgeInsets.zero,
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            IconButton(
                splashRadius: 20,
                color: Colors.white,
                iconSize: 20,
                onPressed: () {
                  dishCounter.counter.value++;
                  context.read(homePageViewProvider).addToCart(dishCounter);
                },
                icon: Icon(Icons.add)),
            Gap(10),
            Text(
              dishCounter.counter.value.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(10),
            IconButton(
                splashRadius: 20,
                color: Colors.white,
                iconSize: 20,
                onPressed: () {
                  dishCounter.counter.value > 0
                      ? dishCounter.counter.value--
                      : null;
                  context
                      .read(homePageViewProvider)
                      .removeFromCart(dishCounter);
                },
                icon: Icon(Icons.remove))
          ],
        ),
      ),
    );
  }
}
