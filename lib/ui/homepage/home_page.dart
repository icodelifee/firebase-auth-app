import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertest/ui/homepage/home_cart.dart';
import 'package:fluttertest/ui/homepage/homepage_viewmodel.dart';
import 'package:fluttertest/ui/homepage/widgets/dish_list.dart';
import 'package:fluttertest/ui/homepage/widgets/home_drawer.dart';
import 'package:fluttertest/ui/homepage/widgets/home_error_widget.dart';
import 'package:fluttertest/ui/widgets/auth_locator_loading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_context/one_context.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _restaurantProvider = useProvider(restaurantProvider);
    final provider = useProvider(homePageViewProvider);

    return _restaurantProvider.when(
      data: (data) {
        // creates a list of list of dishe
        //with each having its own value notifier
        provider.counters = data.tableMenuList!
            .map((e) => e.categoryDishes!
                .map((e) => DishQuantityCounter(dish: e, counter: useState(0)))
                .toList())
            .toList();

        return DefaultTabController(
          length: data.tableMenuList!.length,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              actions: [cartIcon(provider.cartList.length)],
              bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.red,
                indicatorColor: Colors.red,
                tabs: data.tableMenuList!
                    .map((menu) => Tab(
                          text: menu.menuCategory,
                        ))
                    .toList(),
              ),
            ),
            drawer: HomeDrawer(),
            body: TabBarView(
              children: data.tableMenuList!
                  .asMap()
                  .map((i, menu) => MapEntry(
                        i,
                        DishList(
                          menu: menu,
                          counterIndex: i,
                        ),
                      ))
                  .values
                  .toList(),
            ),
          ),
        );
      },
      loading: () => AuthLocatorLoading(),
      error: (error, stackTrace) => HomeErrorWidget(
        error: error,
      ),
    );
  }

  Widget cartIcon(int cartCount) {
    return MaterialButton(
        onPressed: () =>
            OneContext().push(MaterialPageRoute(builder: (_) => HomeCart())),
        minWidth: 40,
        padding: EdgeInsets.only(right: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.shopping_cart_outlined),
            Text(
              cartCount.toString(),
              style: TextStyle(fontSize: 9),
            )
          ],
        ));
  }
}
