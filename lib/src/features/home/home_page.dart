import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'store/home_store.dart';
import 'widgets/widgets.dart';
import '../../shared/constants/constants.dart';
import '../../shared/widgets/widgets.dart';

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

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return Observer(
      builder: (_) {
        if (store.isLoading) {
          return Material(
            color: AppColors.white,
            child: ProgressIndicatorWidget(),
          );
        }

        return Scaffold(
          appBar: AppBarWidget(title: 'Olá José'),
          floatingActionButton: Observer(builder: (_) {
            if (store.onError != null) return SizedBox();

            return FabWidget(
              onTap: () {},
              label: 'Inserir',
            );
          }),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: (store.onError != null)
              ? CustomErrorWidget(
                  message: store.onError?.message ?? 'Erro interno',
                  reload: store.init,
                )
              : Container(
                  decoration: BoxDecoration(
                    gradient: AppGradients.purpleGradientScaffold,
                  ),
                  child: RefreshIndicator(
                    onRefresh: () async => store.init(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GeneralBalanceWidget(
                            balance: store.state.generalBalance,
                          ),
                          SizedBox(height: 18.0),
                          DailyWidget(
                            balance: store.state.dailyBalance,
                            inputs: store.state.inputs,
                            outputs: store.state.outputs,
                            month: store.selectedMonthDescription,
                          ),
                          SizedBox(height: 18.0),
                          LastTransactionsWidget(
                            transactions: store.state.transactions,
                          ),
                          SizedBox(height: sizeScreen.height * 0.1),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
