import 'package:flutter/material.dart';

import 'home_controller.dart';
import 'widgets/widgets.dart';
import '../../shared/constants/constants.dart';
import '../../shared/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller;

  @override
  void initState() {
    _controller = HomeController();
    super.initState();
  }

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
                GeneralBalanceWidget(
                  balance: _controller.generalBalance,
                ),
                SizedBox(height: 18.0),
                DayByDayWidget(
                  balance: _controller.dayByDayBalance,
                  inputs: _controller.inputs,
                  outputs: _controller.outputs,
                  month: _controller.selectedMonth,
                ),
                SizedBox(height: 18.0),
                LatestTransactionsWidget(
                  transactions: _controller.transactions,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
