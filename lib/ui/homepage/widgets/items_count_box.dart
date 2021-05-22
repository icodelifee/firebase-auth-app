import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_context/one_context.dart';

import '../homepage_viewmodel.dart';

class ItemsCountBox extends HookWidget {
  const ItemsCountBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(homePageViewProvider);
    final totalItems = provider.getTotalCartItems();
    return Container(
      width: OneContext.instance.mediaQuery.size.width,
      height: 80,
      decoration: BoxDecoration(
          color: Colors.green[900], borderRadius: BorderRadius.circular(7)),
      child: Center(
        child: Text(
          '${provider.cartList.length} Dishes - $totalItems Items',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
