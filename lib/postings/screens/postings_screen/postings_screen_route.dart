import 'package:flutter/material.dart';
import 'package:joelslist/postings/screens/postings_screen/postings_screen.dart';

class PostingSreenRoute {
  static const String routeName = '/postings';

  static MaterialPageRoute route(RouteSettings settings) {
    String? searchQuery =
        Uri.parse(settings.name ?? '').queryParameters['query'];

    return MaterialPageRoute(
        settings: settings,
        builder: (context) => PostingsScreen(searchQuery: searchQuery)
    );
  }
}
