import 'package:flutter/material.dart';
import 'package:my_expen/constants/pages.dart';
import 'package:my_expen/screens/home_page.dart';
import 'package:my_expen/screens/sec_page.dart';
import 'package:my_expen/screens/third_page.dart';

class MyRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case homePage:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case secondPage:
        var d = setting.arguments as String;
        return MaterialPageRoute(builder: (context) => SecondPage(d));
      case thirdPage:
        return MaterialPageRoute(builder: (context) => const Thirdpage());
      default:
    }
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Text("No Route Defined"),
      ),
    );
  }
}
