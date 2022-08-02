import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joelslist/locator.dart';
import 'package:joelslist/navigation/root_router.dart';

void main() {
  setUpLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.latoTextTheme()),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RootRouter.generateRoute,
    );
  }
}
