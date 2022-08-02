import 'package:flutter/material.dart';
import 'package:joelslist/postings/screens/post_screen/post_screen.dart';


class PostScreenRoute {

  static const String routeName = '/post';

  static PageRoute route(RouteSettings settings) {
    String? postId =
        Uri.parse(settings.name ?? '').queryParameters['postId'];

    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => PostScreen(postId: postId),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }


}
