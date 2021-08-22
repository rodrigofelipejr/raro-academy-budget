import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/constants/constants.dart';
import '../../../../shared/models/models.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../../home/home.dart';
import '../../errors/erros.dart';
import 'stores/transactions_store.dart';
import 'widgets/widgets.dart';

class TransactionsPage extends StatefulWidget {
  final int? indexPage;
  const TransactionsPage({Key? key, this.indexPage}) : super(key: key);

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends ModularState<TransactionsPage, TransactionsStore> with Delays {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<ReactionDisposer> _disposers = [];
  final PageController _pageController = PageController();

  void _navigatorToPage(int index) {
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  @override
  void initState() {
    super.initState();

    _disposers.add(reaction<bool>((_) => store.isLoading, (bool loading) {
      (loading)
          ? OverlayWidget.show(context, label: AppStrings.txtCarregando)
          : delayDefault((_) => OverlayWidget.hide());
    }));

    store.init();

    _disposers.add(when((_) => store.isLoading == false, () {
      if (widget.indexPage != null) delayDefault((_) => _navigatorToPage(widget.indexPage!));
    }));
  }

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());
    super.dispose();
  }

  void _callDeleteTransaction(BuildContext context, {required String docId}) async {
    final deleteSuccess = await store.deleteTransaction(docId);
    (deleteSuccess)
        ? _dialogDeleteSuccess(context)
        : _dialogDeleteError(context, onPressedPrimary: () async => _callDeleteTransaction(context, docId: docId));
  }

  void _dialogDeleteSuccess(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => DialogWidget.success(
        message: AppStrings.bodyDialogSucessoExclusao,
        textButtonSecondary: AppStrings.txtFechar,
      ),
    );
  }

  void _dialogDeleteError(BuildContext context, {required Future<void> Function() onPressedPrimary}) {
    showDialog(
      context: context,
      builder: (_) => DialogWidget.error(
        message: AppStrings.bodyDialogErroExclusao,
        textButtonPrimary: AppStrings.txtRepetir,
        onPressedPrimary: onPressedPrimary,
      ),
    );
  }

  void _dialogConfirmDelete(BuildContext context, {required String docId}) async {
    await showDialog(
      context: context,
      builder: (contextDialog) => DialogWidget.warning(
        message: AppStrings.bodyDialogConfirmarExclusao,
        textButtonPrimary: AppStrings.txtExcluir,
        onPressedPrimary: () async => _callDeleteTransaction(context, docId: docId),
      ),
    );
  }

  void _navigateToDetails(TransactionModel transaction) {
    final route = transaction.type.index == 0 ? AppRoutes.expenses : AppRoutes.income;
    Modular.to.pushNamed(route, arguments: transaction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Observer(builder: (_) {
        return Visibility(
          visible: store.onError == null && store.indexPage != 2,
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
            onPressed: () => Modular.to.pop(),
          ),
        ),
        flexibleSpace: ButtonsTabBarWidget(
          buttonInput: () => _navigatorToPage(0),
          buttonOutput: () => _navigatorToPage(1),
          buttonAll: () => _navigatorToPage(2),
        ),
        toolbarHeight: screenHeightPercentage(context) * 0.25, //TODO - limitar tamanho máximo
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
        if (store.onError != null && store.onError is TransactionError)
          return Center(
            child: CustomErrorWidget(
              message: AppStrings.txtErroCarregamentoTransacoes,
              onTap: () => store.init(),
            ),
          );
        if (!store.isLoading)
          return PageView(
            onPageChanged: (value) => store.setIndexPage(value),
            controller: _pageController,
            children: [
              CardTransactionsWidget(
                label: 'Total entradas',
                totalColor: AppColors.greenLight,
                fixedPrefix: '+',
                total: store.transactionInputTotal,
                transactions: store.transactionInput,
                onLongPress: (String value) => _dialogConfirmDelete(_scaffoldKey.currentContext!, docId: value),
                onTap: _navigateToDetails,
              ),
              CardTransactionsWidget(
                label: 'Total saídas',
                totalColor: AppColors.redLight,
                fixedPrefix: '-',
                total: store.transactionOutputTotal,
                transactions: store.transactionOutput,
                onLongPress: (String value) => _dialogConfirmDelete(_scaffoldKey.currentContext!, docId: value),
                onTap: _navigateToDetails,
              ),
              CardTransactionsWidget(
                label: 'Total',
                total: store.transactionTotal,
                transactions: store.transactions,
                onLongPress: (String value) => _dialogConfirmDelete(_scaffoldKey.currentContext!, docId: value),
                onTap: _navigateToDetails,
              ),
            ],
          );

        return SizedBox();
      }),
    );
  }
}
