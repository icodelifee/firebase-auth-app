import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertest/ui/homepage/homepage_viewmodel.dart';
import 'package:fluttertest/ui/homepage/widgets/dish_category.dart';
import 'package:fluttertest/ui/homepage/widgets/dish_counter.dart';
import 'package:fluttertest/ui/homepage/widgets/dish_name.dart';
import 'package:fluttertest/ui/homepage/widgets/items_count_box.dart';
import 'package:fluttertest/ui/homepage/widgets/place_order_button.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_context/one_context.dart';
import 'package:fluttertest/utils/extensions/sarToInr.dart';

class HomeCart extends HookWidget {
  const HomeCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(homePageViewProvider);
    final totalAmount = provider.getTotalCartAmount();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Order Summary',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  ItemsCountBox(),
                  SizedBox(
                    height: OneContext().mediaQuery.size.height / 2,
                    child: Scrollbar(
                      isAlwaysShown: true,
                      child: ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: provider.cartList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final dishcounter = provider.cartList[index];
                          return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DishCategory(
                                    dishType: dishcounter.dish.dishType!),
                                Gap(30),
                                _dishDetails(dishcounter),
                                Flexible(
                                  child: Text(
                                    'INR ${dishcounter.dish.dishPrice!.sarToInr()}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Divider(),
                  _totalAmount(totalAmount)
                ],
              ),
            ),
            Spacer(),
            PlaceOrderButton()
          ],
        ),
      ),
    );
  }

  Column _dishDetails(DishQuantityCounter dishcounter) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DishName(
          dishName: dishcounter.dish.dishName!,
        ),
        Gap(15),
        Text(
          '${dishcounter.dish.dishCalories} calories',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Gap(15),
        DishCounter(dishCounter: dishcounter)
      ],
    );
  }

  Padding _totalAmount(double totalAmount) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total Amount',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            'INR ${totalAmount.toStringAsFixed(2)}',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green),
          )
        ],
      ),
    );
  }
}
