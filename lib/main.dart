import 'package:flutter/material.dart';
import 'layout/layout.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.black,
    ),
    home: MyApp(),
  ));
}
