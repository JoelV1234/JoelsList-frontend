import 'package:flutter/material.dart';
import 'package:joelslist/postings/screens/postings_screen/postings_screen_route.dart';

class RootRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    final settingsUri = Uri.parse(settings.name ?? '/');

    switch (settingsUri.path) {
      case PostingSreenRoute.routeName:
        return PostingSreenRoute.route(settings);
      default:
        return PostingSreenRoute.route(settings);
    }
  }
}
