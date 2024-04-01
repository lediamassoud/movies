import 'package:flutter/material.dart';
import 'package:movies_app/homescreen.dart';
import 'package:movies_app/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies App",
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.routeName: (_) => const Splash(),
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
      initialRoute: Splash.routeName,
    );
  }
}
