import 'package:budget/src/features/daily/daily_state.dart';
import 'package:budget/src/features/daily/daily_store.dart';
import 'package:budget/src/features/daily/models/transaction_model.dart';
import 'package:budget/src/features/daily/widgets/all_card.dart';
import 'package:budget/src/features/daily/widgets/buttons_appbar.dart';
import 'package:budget/src/features/daily/widgets/input_card.dart';
import 'package:budget/src/features/daily/widgets/output_card.dart';
import 'package:budget/src/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({Key? key}) : super(key: key);

  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends ModularState<DailyPage, DailyStore> {
  final PageController _pageController = PageController();
  int screen = 0;
  void navigator({required int pageindex}) {
    _pageController.animateToPage(
      pageindex,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 28,
        ),
        onPressed: () {},
      ),
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
          buttonin: () => navigator(pageindex: 0),
          buttonout: () => navigator(pageindex: 1),
          buttonall: () => navigator(pageindex: 2),
          tela: screen,
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.22,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: MonthSelectorWidget(
                label: "agosto",
                referenceDate: DateTime(2021, 08),
                changeSelectedDate: (daa) {},
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        onPageChanged: (page) {
          screen = page;
          setState(() {});
        },
        controller: _pageController,
        children: [
          /////////////////////////////////////////////////////////////////////////////////////
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 2,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.544,
                        child: Observer(
                          builder: (_) {
                            if (controller.transactionList!.hasError) {
                              return Center(
                                child: ElevatedButton(
                                    onPressed: () => controller.transactionList,
                                    child: Text("clica ai")),
                              );
                            }
                            if (controller.transactionList!.data == null) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            List<TransactionDailyModel> list =
                                controller.transactionList!.data;
                            return ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (_, index) {
                                return ListTile();
                              },
                            );
                          },
                        ),
                      ),
                      Divider(
                        height: 1,
                      ),
                      Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total entradas',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 52, 48, 144)),
                                ),
                                Text(
                                  'R\$123123'
                                  // ${Formatters.formatMoney(sun(listvalue))}'
                                  ,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 88, 179, 104)),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
          /////////////////////////////////////////////////////////////////////////////////////
          OutCard(),
          AllCard(),
        ],
      ),
    );
  }
}
