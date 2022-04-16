import 'package:flutter/material.dart';
import 'package:NexGoo/pages/home.dart';
import 'package:NexGoo/pages/detail.dart';
import 'package:NexGoo/pages/category.dart';

class Routes {
  static const onBoarding = "/";
  static const home = "/home";
  static const detail = "/detail";
  static const category = "/category";
}

class RouterGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        );
      case Routes.detail:
        return MaterialPageRoute(
          builder: ((context) => const DetailScreen()),
        );
      case Routes.category:
        return MaterialPageRoute(
          builder: ((context) => const CategoryScreen()),
        );
      default:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        );
    }
  }
}
