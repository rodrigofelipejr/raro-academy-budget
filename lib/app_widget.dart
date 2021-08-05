import 'package:flutter/material.dart';
import 'package:flutter_finance_controller/src/features/day_by_day/day_page.dart';
import 'package:flutter_finance_controller/src/features/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
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
