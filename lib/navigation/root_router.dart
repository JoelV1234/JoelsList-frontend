// ignore_for_file: no_duplicate_case_values

import 'package:flutter/material.dart';
import 'package:joelslist/postings/screens/post_screen/post_screen_route.dart';
import 'package:joelslist/postings/screens/postings_screen/postings_screen_route.dart';

class RootRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final settingsUri = Uri.parse(settings.name ?? '/');

    switch (settingsUri.path) {
      case PostingSreenRoute.routeName:
        return PostingSreenRoute.route(settings);
      case PostScreenRoute.routeName:
        return PostScreenRoute.route(settings);
      default:
        return PostingSreenRoute.route(settings);
    }
  }
}
