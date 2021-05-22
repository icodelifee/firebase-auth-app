import 'package:flutter/cupertino.dart';
import 'package:fluttertest/data/models/dish.dart';
import 'package:fluttertest/data/models/restaurant.dart';
import 'package:fluttertest/data/providers/api_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fluttertest/utils/extensions/sarToInr.dart';

final restaurantProvider = FutureProvider<Restaurant>(
  (ref) => ref.read(apiRepositoryProvider).getRestaurantMenus(),
);

final homePageViewProvider = ChangeNotifierProvider(
  (ref) => HomePageViewModel(),
);

class HomePageViewModel extends ChangeNotifier {
  var counters = <List<DishQuantityCounter>>[];
  final cartList = <DishQuantityCounter>[];

  int getTotalCartItems() {
    if (cartList.isEmpty) {
      return 0;
    } else {
      return cartList
          .map((e) => e.counter.value)
          .reduce((value, element) => value + element);
    }
  }

  double getTotalCartAmount() {
    if (cartList.isEmpty) {
      return 0;
    } else {
      return cartList
          .map((e) =>
              e.counter.value * double.parse(e.dish.dishPrice!.sarToInr()))
          .reduce((value, element) => value + element);
    }
  }

  void addToCart(DishQuantityCounter dish) {
    final index =
        cartList.indexWhere((element) => identical(element.dish, dish.dish));

    // if element not found; add to cart
    if (index == -1) {
      cartList.add(dish);
    } else {
      // replace the element with new value
      cartList[index] = dish;
    }
    notifyListeners();
  }

  void removeFromCart(DishQuantityCounter dish) {
    final index =
        cartList.indexWhere((element) => identical(element.dish, dish.dish));

    if (index != -1) {
      // remove from list only if counter is 0
      if (dish.counter.value > 0) {
        cartList[index] = dish;
      } else {
        cartList.removeAt(index);
      }
    }
    notifyListeners();
  }
}

class DishQuantityCounter {
  DishQuantityCounter({
    required this.dish,
    required this.counter,
  });
  final Dish dish;
  final ValueNotifier<int> counter;
}
