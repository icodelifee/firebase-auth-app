import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class DishName extends StatelessWidget {
  const DishName({Key? key, required this.dishName}) : super(key: key);
  final String dishName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: OneContext().mediaQuery.size.width / 2,
      child: Text(
        dishName.toString(),
        style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 16, height: 0.9),
      ),
    );
  }
}
