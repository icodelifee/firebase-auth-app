import 'package:flutter/material.dart';
import 'package:fluttertest/auth_locator.dart';
import 'package:one_context/one_context.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase',
      builder: OneContext().builder,
      navigatorKey: OneContext().key,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthLocator(),
    );
  }
}
