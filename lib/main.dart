import 'package:flutter/material.dart';
import 'package:flutter_finance_controller/src/features/day%20by%20day/day_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DayPage(),
    );
  }
}
