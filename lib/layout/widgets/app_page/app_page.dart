import 'package:flutter/material.dart';
import 'package:joelslist/config/color_config.dart';

class AppPage extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget> actions;
  final List<Widget> leading;
  const AppPage({Key? key, 
    this.title = '', 
    required this.child,
    this.actions = const [],
    this.leading = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text(title),
        actions: actions,
        leading: leading.isNotEmpty ? Row(children: leading) : null,
      ),
      body: child,
    );
  }
}
