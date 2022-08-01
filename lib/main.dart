import 'package:flutter/material.dart';
import 'package:joelslist/locator.dart';
import 'package:joelslist/postings/screens/postings_screen/postings_screen.dart';

void main() {
  setUpLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PostingsScreen(),
      ),
    );
  }
}
