import 'package:flutter/material.dart';
import 'package:flutter_finance_controller/src/shared/constants/app_gradients.dart';

import 'widgets/widgets.dart';
import '../../shared/widgets/widgets.dart';

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
      floatingActionButton: FabWidget(
        onTap: () {},
        label: 'novo controle',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.purpleGradientScaffold,
        ),
        child: RefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GeneralBalanceWidget(),
                SizedBox(height: 18.0),
                DayByDayWidget(),
                SizedBox(height: 18.0),
                LatestTransactionsWidget(
                  transactions: List.generate(3, (index) => index),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
