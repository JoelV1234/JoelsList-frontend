import 'package:flutter/material.dart';
import 'package:joelslist/layout/widgets/app_page/search_daelegate.dart';

class AppPage extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget> actions;
  final List<Widget> leading;
  final AppPageSearchDelegate? appPageSearchDelegate;
  const AppPage({Key? key, 
    this.title = '', 
    required this.child,
    this.actions = const [],
    this.leading = const [],
    this.appPageSearchDelegate
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          if (appPageSearchDelegate != null)
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: appPageSearchDelegate!);
              }, 
              icon: const Icon(Icons.search)
            )
        ] + actions,
        leading: leading.isNotEmpty ? Row(children: leading) : null,
      ),
      body: child,
    );
  }
}
