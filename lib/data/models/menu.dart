import 'package:fluttertest/data/models/dish.dart';

class Menu {
  Menu({
    this.menuCategory,
    this.menuCategoryId,
    this.menuCategoryImage,
    this.nexturl,
    this.categoryDishes,
  });

  String? menuCategory;
  String? menuCategoryId;
  String? menuCategoryImage;
  String? nexturl;
  List<Dish>? categoryDishes;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        menuCategory: json['menu_category'],
        menuCategoryId: json['menu_category_id'],
        menuCategoryImage: json['menu_category_image'],
        nexturl: json['nexturl'],
        categoryDishes: List<Dish>.from(
            json['category_dishes'].map((x) => Dish.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'menu_category': menuCategory,
        'menu_category_id': menuCategoryId,
        'menu_category_image': menuCategoryImage,
        'nexturl': nexturl,
        'category_dishes':
            List<dynamic>.from(categoryDishes!.map((x) => x.toJson())),
      };
}
