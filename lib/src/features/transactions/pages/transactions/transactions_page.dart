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
  final int? indexPage;
  const TransactionsPage({Key? key, this.indexPage}) : super(key: key);

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends ModularState<TransactionsPage, TransactionsStore> {
  final PageController _pageController = PageController();

  void _navigatorToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    store.init();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: 400));
      if (widget.indexPage != null) _navigatorToPage(widget.indexPage!);
    });
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
          buttonInput: () => _navigatorToPage(0),
          buttonOutput: () => _navigatorToPage(1),
          buttonAll: () => _navigatorToPage(2),
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
              transactions: store.transactionsByMonth,
              totalValue: store.transactionTotal,
            ),
          ],
        );
      }),
    );
  }
}
