import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Olá José'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GeneralBalanceWidget(),
            SizedBox(
              height: 23.0,
            ),
            DayByDayWidget(),
          ],
        ),
      ),
    );
  }
}
