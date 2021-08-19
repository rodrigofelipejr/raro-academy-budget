import 'package:budget/src/features/transactions/pages/transactions/transactions_store.dart';
import 'package:budget/src/features/transactions/pages/transactions/widgets/output_card.dart';
import 'package:budget/src/shared/constants/app_routes.dart';
import 'package:budget/src/shared/utils/dates.dart';
import 'package:budget/src/shared/widgets/fab_widget.dart';
import 'package:budget/src/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../home/home.dart';
import 'widgets/all_card.dart';
import 'widgets/buttons_appbar.dart';
import 'widgets/input_card.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState
    extends ModularState<TransactionsPage, TransactionsStore> {
  final PageController _pageController = PageController();

  void _navigator({required int index}) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Observer(builder: (_) {
        return Visibility(
          visible: controller.indexPage != 2,
          child: FabWidget(onTap: () {
            Modular.to.pushNamed(controller.indexPage == 0
                ? AppRoutes.income
                : AppRoutes.expenses);
          }),
        );
      }),
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        flexibleSpace: ButtonsAppBarDay(
          buttonIn: () => _navigator(index: 0),
          buttonOut: () => _navigator(index: 1),
          buttonAll: () => _navigator(index: 2),
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.22,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Observer(builder: (_) {
                final homeStore = Modular.get<HomeStore>();
                return MonthSelectorWidget(
                  flatStyle: true,
                  label: Dates.descriptionMonth(
                      homeStore.dailyStore.state.date.month),
                  referenceDate: homeStore.dailyStore.state.date,
                  changeSelectedDate: (DateTime date) {
                    homeStore.dailyStore.handleDaily(date: date);
                    controller.handleGetTransaction();
                  },
                );
              }),
            ),
          ),
        ],
      ),
      body: Observer(builder: (_) {
        if (controller.isLoading)
          return Center(
            child: LoadingWidget(),
          );

        if (controller.onError != null)
          return Center(
            child: CustomErrorWidget(
                message: "Error interno", reload: () => controller.init()),
          );

        return PageView(
          onPageChanged: (value) => controller.setIndexPage(value),
          controller: _pageController,
          children: [
            InputCard(
              value: controller.transactionInputTotal,
              transaction: controller.transactionInput,
            ),
            OutCard(
              value: controller.transactionOutputTotal,
              transaction: controller.transactionOutput,
            ),
            AllCard(
              value: controller.transactionTotal,
              transaction: controller.transactions,
            ),
          ],
        );
      }),
    );
  }
}
