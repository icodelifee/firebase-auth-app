import 'dart:convert';

import 'package:fluttertest/data/models/menu.dart';

List<Restaurant> restaurantFromJson(List<dynamic> str) =>
    List<Restaurant>.from(str.map((x) => Restaurant.fromJson(x)));

String? restaurantToJson(List<Restaurant> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Restaurant {
  Restaurant({
    this.restaurantId,
    this.restaurantName,
    this.restaurantImage,
    this.tableId,
    this.tableName,
    this.branchName,
    this.nexturl,
    this.tableMenuList,
  });

  String? restaurantId;
  String? restaurantName;
  String? restaurantImage;
  String? tableId;
  String? tableName;
  String? branchName;
  String? nexturl;
  List<Menu>? tableMenuList;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        restaurantId: json['restaurant_id'],
        restaurantName: json['restaurant_name'],
        restaurantImage: json['restaurant_image'],
        tableId: json['table_id'],
        tableName: json['table_name'],
        branchName: json['branch_name'],
        nexturl: json['nexturl'],
        tableMenuList: List<Menu>.from(
            json['table_menu_list'].map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'restaurant_id': restaurantId,
        'restaurant_name': restaurantName,
        'restaurant_image': restaurantImage,
        'table_id': tableId,
        'table_name': tableName,
        'branch_name': branchName,
        'nexturl': nexturl,
        'table_menu_list':
            List<dynamic>.from(tableMenuList!.map((x) => x.toJson())),
      };
}

enum DishCurrency { INR }

final dishCurrencyValues = EnumValues({'INR': DishCurrency.INR});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
