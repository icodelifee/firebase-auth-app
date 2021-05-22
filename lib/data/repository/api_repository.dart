import 'package:fluttertest/data/models/restaurant.dart';

abstract class APIRepository {
  Future<Restaurant> getRestaurantMenus();
}
