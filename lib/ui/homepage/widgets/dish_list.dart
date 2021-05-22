import 'package:flutter/material.dart';
import 'package:fluttertest/data/models/dish.dart';
import 'package:fluttertest/data/models/menu.dart';
import 'package:fluttertest/ui/homepage/homepage_viewmodel.dart';
import 'package:fluttertest/ui/homepage/widgets/dish_category.dart';
import 'package:fluttertest/ui/homepage/widgets/dish_counter.dart';
import 'package:fluttertest/ui/homepage/widgets/dish_name.dart';
import 'package:gap/gap.dart';
import 'package:one_context/one_context.dart';
import 'package:fluttertest/utils/extensions/sarToInr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DishList extends StatelessWidget {
  const DishList({required this.menu, required this.counterIndex});
  final Menu menu;
  final int counterIndex;
  final _dishImageUrl = 'https://del.dog/useryll';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (_, __) => Divider(),
        itemCount: menu.categoryDishes!.length,
        itemBuilder: (context, index) {
          final dish = menu.categoryDishes![index];
          return Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DishCategory(dishType: dish.dishType!),
                    Gap(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DishName(
                          dishName: dish.dishName!,
                        ),
                        Gap(10),
                        _dishPriceAndKcal(dish),
                        Gap(10),
                        SizedBox(
                            width: OneContext().mediaQuery.size.width / 2,
                            child: Text(dish.dishDescription!.toString())),
                        Gap(15),
                        DishCounter(
                          dishCounter: context
                              .read(homePageViewProvider)
                              .counters[counterIndex][index],
                        ),
                        if (dish.addonCat!.isNotEmpty) Gap(20) else SizedBox(),
                        Text(
                          dish.addonCat!.isNotEmpty
                              ? 'Customization available'
                              : '',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ],
                ),
                Image.network(
                  _dishImageUrl,
                  width: OneContext().mediaQuery.size.width * 0.2,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  SizedBox _dishPriceAndKcal(Dish dish) => SizedBox(
        width: OneContext().mediaQuery.size.width / 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Rs ${dish.dishPrice!.sarToInr()}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${dish.dishCalories!} kcal',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
}
