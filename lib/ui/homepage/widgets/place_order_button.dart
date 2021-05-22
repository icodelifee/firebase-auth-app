import 'package:flutter/material.dart';
import 'package:fluttertest/ui/homepage/homepage_viewmodel.dart';
import 'package:gap/gap.dart';
import 'package:one_context/one_context.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        await OneContext().showDialog(
            builder: (_) => Dialog(
                  insetPadding: EdgeInsets.all(30),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.done_all_rounded,
                          size: 100,
                          color: Colors.green,
                        ),
                        Gap(20),
                        Text(
                          'Order Succesfully Placed!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Gap(20),
                        MaterialButton(
                          minWidth: OneContext().mediaQuery.size.width / 3,
                          height: 40,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          color: Colors.green,
                          onPressed: () {
                            OneContext.instance.popAllDialogs();
                            OneContext.instance.pop();
                          },
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ));
        context.refresh(homePageViewProvider);
        await context.refresh(restaurantProvider);
      },
      minWidth: OneContext().mediaQuery.size.width,
      height: 60,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Colors.green[900],
      child: Text(
        'Place Order',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
