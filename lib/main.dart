import 'package:flutter/material.dart';
import 'package:newsapp2/app_theme.dart';
import 'package:newsapp2/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (context) => HomePage(),
      },
      initialRoute: HomePage.routeName,
      theme: AppTheme.lightmode,
    );
  }
}
