import 'package:flutter/material.dart';

class NavUtils {
  static MaterialPageRoute<T> route<T>({
    required Widget route,
    RouteSettings? settings
  }) {
    return MaterialPageRoute(
      builder: (context) => route,
      settings: settings
    );
  }

  static Future<T?> push<T>(BuildContext context, Widget screen) async {
    return Navigator.of(context).push<T>(route(route : screen));
  }
}