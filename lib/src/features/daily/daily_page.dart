import 'package:budget/src/features/daily/daily_store.dart';
import 'package:budget/src/features/daily/widgets/all_card.dart';
import 'package:budget/src/features/daily/widgets/buttons_appbar.dart';
import 'package:budget/src/features/daily/widgets/input_card.dart';
import 'package:budget/src/features/daily/widgets/output_card.dart';
import 'package:budget/src/features/home/home.dart';
import 'package:budget/src/features/home/widgets/widgets.dart';
import 'package:budget/src/shared/utils/dates.dart';
import 'package:budget/src/shared/widgets/fab_widget.dart';
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
      floatingActionButton: FabWidget(onTap: () {}),
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
          buttonin: () => _navigator(index: 0),
          buttonout: () => _navigator(index: 1),
          buttonall: () => _navigator(index: 2),
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.22,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Observer(builder: (_) {
                final homestore = Modular.get<HomeStore>();
                return MonthSelectorWidget(
                  label: Dates.descriptionMonth(
                      homestore.state.selectedDate.month),
                  referenceDate: homestore.state.selectedDate,
                  changeSelectedDate: (DateTime date) {
                    homestore.handleChangeMonthSelected(date);
                  },
                );
              }),
            ),
          ),
        ],
      ),
      body: Observer(builder: (_) {
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
