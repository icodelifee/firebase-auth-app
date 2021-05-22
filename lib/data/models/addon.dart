import 'package:fluttertest/data/models/dish.dart';

class AddonCat {
  AddonCat({
    this.addonCategory,
    this.addonCategoryId,
    this.addonSelection,
    this.nexturl,
    this.addons,
  });

  String? addonCategory;
  String? addonCategoryId;
  int? addonSelection;
  String? nexturl;
  List<Dish>? addons;

  factory AddonCat.fromJson(Map<String, dynamic> json) => AddonCat(
        addonCategory: json['addon_category'],
        addonCategoryId: json['addon_category_id'],
        addonSelection: json['addon_selection'],
        nexturl: json['nexturl'],
        addons: List<Dish>.from(json['addons'].map((x) => Dish.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'addon_category': addonCategory,
        'addon_category_id': addonCategoryId,
        'addon_selection': addonSelection,
        'nexturl': nexturl,
        'addons': List<dynamic>.from(addons!.map((x) => x.toJson())),
      };
}
