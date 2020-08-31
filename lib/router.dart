import 'package:flutter/material.dart';
import 'package:flutter_module/pages/detail/detail_article.dart';
import 'package:flutter_module/pages/404.dart';
import 'package:flutter_module/pages/detail/detail_category.dart';
import 'package:flutter_module/pages/search.dart';

class AppRouter {
  static const detail = "/detail";
  static const search = "/search";
  static const categoryDetail = '/category_detail';

  static final Map<String, WidgetBuilder> routes = {
    detail: (context) => DetailPage(),
    search: (context) => SearchPage(),
    categoryDetail: (context) => CategoryDetailPage()
  };

  static final RouteFactory generateRoute = (settings) {
    print("generateRoute -> ${settings.name}");
    return MaterialPageRoute(builder: (ctx) {
      return UnknownPage();
    });
  };

  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) {
      return UnknownPage();
    });
  };

  static void open(BuildContext context, String name, {Object arg}) {
    Navigator.of(context).pushNamed(name, arguments: arg);
  }
}
