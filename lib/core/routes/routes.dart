import 'package:NexGoo/pages/trending.dart';
import 'package:flutter/material.dart';
import 'package:NexGoo/pages/home.dart';
import 'package:NexGoo/pages/detail.dart';
import 'package:NexGoo/pages/category.dart';
import 'package:NexGoo/pages/newLesson.dart';

class Routes {
  static const onBoarding = "/";
  static const home = "/home";
  static const detail = "/detail";
  static const category = "/category";

  ///
  static const myLesson = "/my_lesson";
  static const trending = "/trending";
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
          settings: settings,
        );
      case Routes.category:
        return MaterialPageRoute(
          builder: ((context) => const CategoryScreen()),
          settings: settings,
        );

      ///
      case Routes.myLesson:
        return MaterialPageRoute(
          builder: (context) => const NewLessonScreen(),
        );
      case Routes.trending:
        return MaterialPageRoute(
          builder: (context) => const TrendingScreen(),
        );

      ///
      ///
      default:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        );
    }
  }
}
