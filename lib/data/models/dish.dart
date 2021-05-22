import 'package:fluttertest/data/models/restaurant.dart';

import 'addon.dart';

class Dish {
  Dish({
    this.dishId,
    this.dishName,
    this.dishPrice,
    this.dishImage,
    this.dishCurrency,
    this.dishCalories,
    this.dishDescription,
    this.dishAvailability,
    this.dishType,
    this.nexturl,
    this.addonCat,
  });

  String? dishId;
  String? dishName;
  double? dishPrice;
  String? dishImage;
  DishCurrency? dishCurrency;
  double? dishCalories;
  String? dishDescription;
  bool? dishAvailability;
  int? dishType;
  String? nexturl;
  List<AddonCat>? addonCat;

  factory Dish.fromJson(Map<String, dynamic> json) => Dish(
        dishId: json['dish_id'],
        dishName: json['dish_name'],
        dishPrice: json['dish_price'].toDouble(),
        dishImage: json['dish_image'],
        dishCurrency: dishCurrencyValues.map[json['dish_currency']],
        dishCalories: json['dish_calories'],
        dishDescription: json['dish_description'],
        dishAvailability: json['dish_Availability'],
        dishType: json['dish_Type'],
        nexturl: json['nexturl'],
        addonCat: json['addonCat'] == null
            ? null
            : List<AddonCat>.from(
                json['addonCat'].map((x) => AddonCat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'dish_id': dishId,
        'dish_name': dishName,
        'dish_price': dishPrice,
        'dish_image': dishImage,
        'dish_currency': dishCurrencyValues.reverse[dishCurrency],
        'dish_calories': dishCalories,
        'dish_description': dishDescription,
        'dish_Availability': dishAvailability,
        'dish_Type': dishType,
        'nexturl': nexturl,
        'addonCat': addonCat == null
            ? null
            : List<dynamic>.from(addonCat!.map((x) => x.toJson())),
      };
}
