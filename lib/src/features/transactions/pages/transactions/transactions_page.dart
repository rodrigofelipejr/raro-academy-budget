import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/constants/constants.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../../home/home.dart';
import 'stores/transactions_store.dart';
import 'widgets/widgets.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends ModularState<TransactionsPage, TransactionsStore> {
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
    store.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Observer(builder: (_) {
        return Visibility(
          visible: store.indexPage != 2,
          child: FabWidget(onTap: () {
            Modular.to.pushNamed(store.indexPage == 0 ? AppRoutes.income : AppRoutes.expenses);
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
        flexibleSpace: ButtonsTabBarWidget(
          buttonInput: () => _navigator(index: 0),
          buttonOutput: () => _navigator(index: 1),
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
                  label: Dates.descriptionMonth(homeStore.dailyStore.state.date.month),
                  referenceDate: homeStore.dailyStore.state.date,
                  changeSelectedDate: (DateTime date) {
                    homeStore.dailyStore.handleDaily(date: date);
                    store.handleGetTransaction();
                  },
                );
              }),
            ),
          ),
        ],
      ),
      body: Observer(builder: (_) {
        if (store.isLoading)
          return Center(
            child: LoadingWidget(),
          );

        if (store.onError != null)
          return Center(
            child: CustomErrorWidget(
              message: "Erro ao carregar os dados!",
              reload: () => store.init(),
            ),
          );

        return PageView(
          onPageChanged: (value) => store.setIndexPage(value),
          controller: _pageController,
          children: [
            InputTransactionsWidget(
              totalValue: store.transactionInputTotal,
              transactions: store.transactionInput,
            ),
            OutputTransactionsWidget(
              totalValue: store.transactionOutputTotal,
              transactions: store.transactionOutput,
            ),
            AllTransactionsWidget(
              transactions: store.transactions,
              totalValue: store.transactionTotal,
            ),
          ],
        );
      }),
    );
  }
}
