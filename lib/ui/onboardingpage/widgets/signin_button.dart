import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_context/one_context.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    required this.text,
    required this.buttonColor,
    this.icon,
    this.iconImage = 'https://img.icons8.com/color/452/google-logo.png',
    required this.route,
    Key? key,
  }) : super(key: key);
  final String text;
  final Color buttonColor;
  final Widget route;
  final IconData? icon;
  final String iconImage;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () =>
          OneContext().push(MaterialPageRoute(builder: (_) => route)),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: buttonColor,
      height: 70,
      child: SizedBox(
        width: OneContext().mediaQuery.size.width / 1.3,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon == null
                  ? ImageIcon(
                      NetworkImage(iconImage),
                      size: 25,
                      color: Colors.white,
                    )
                  : Icon(
                      icon,
                      color: Colors.white,
                    ),
              Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Gap(10)
            ],
          ),
        ),
      ),
    );
  }
}
