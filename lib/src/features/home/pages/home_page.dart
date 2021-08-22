import 'package:budget/src/shared/utils/screen_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/constants/constants.dart';
import '../../../shared/widgets/widgets.dart';
import '../home.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    super.initState();
    store.init();
  }

  void _insertTransaction() {
    final options = [
      DialogOptionsItem(
        label: 'Entrada',
        onTap: () => Modular.to.pushNamed(AppRoutes.transactionsIncome),
      ),
      DialogOptionsItem(
        label: 'Saída',
        onTap: () => Modular.to.pushNamed(AppRoutes.transactionsExpenses),
      ),
    ];

    showDialog(
      context: context,
      builder: (_) {
        return DialogOptionsWidget(
          title: 'Novo registro',
          message: 'Escolha um tipo de transação:',
          options: options,
          axis: Axis.horizontal,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: store.authStore.welcomeMessage),
      floatingActionButton: Observer(
        builder: (_) => Visibility(
          visible: store.isLoading == false && store.onError == null,
          child: FabWidget(label: 'Inserir', onTap: _insertTransaction),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: DrawerWidget(),
      body: Container(
        constraints: BoxConstraints(
          minHeight: screenHeight(context),
        ),
        decoration: BoxDecoration(
          gradient: AppGradients.purpleGradientScaffold,
        ),
        child: Observer(
          builder: (_) {
            if (store.isLoading)
              return AnimatedSwitcherWidget(
                child: LoadingWidget(),
              );

            if (store.onError != null)
              return AnimatedSwitcherWidget(
                child: CustomErrorWidget(
                  message: AppStrings.txtErroCarregamentoHome,
                  onTap: () => store.init(),
                ),
              );

            return AnimatedSwitcherWidget(
              child: RefreshIndicator(
                onRefresh: () async => await store.init(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GeneralBalanceWidget(),
                      SizedBox(height: 18.0),
                      DailyWidget(),
                      SizedBox(height: 18.0),
                      LastTransactionsWidget(),
                      SpaceBottomWidget(height: 0.1),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
