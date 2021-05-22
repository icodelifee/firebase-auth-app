import 'package:flutter/material.dart';

class DishCategory extends StatelessWidget {
  const DishCategory({Key? key, required this.dishType}) : super(key: key);
  final int dishType;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      dishType == 1 ? 'assets/non-veg.png' : 'assets/veg.png',
      width: 12,
    );
  }
}
