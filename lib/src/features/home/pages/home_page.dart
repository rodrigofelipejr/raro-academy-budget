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

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBarWidget(title: store.authStore.welcomeMessage),
      floatingActionButton: Observer(
        builder: (_) => Visibility(
          visible: store.isLoading == false && store.onError == null,
          child: FabWidget(label: 'Inserir', onTap: () {}),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: DrawerWidget(),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.purpleGradientScaffold,
        ),
        child: Observer(builder: (_) {
          if (store.isLoading)
            return AnimatedSwitcherWidget(
              child: LoadingWidget(),
            );

          if (store.onError != null)
            return AnimatedSwitcherWidget(
              child: CustomErrorWidget(
                reload: () => store.init(),
                message: 'Erro interno',
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
        }),
      ),
    );
  }
}
