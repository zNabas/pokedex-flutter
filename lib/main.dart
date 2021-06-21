import 'package:flutter/material.dart';
import 'package:pokedex/core/app_const.dart';
import 'package:pokedex/core/app_theme.dart';
import 'package:pokedex/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
      theme: kAppTheme,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
