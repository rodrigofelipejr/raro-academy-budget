import 'package:flutter/material.dart';
import 'package:flutter_finance_controller/src/features/day_by_day/shared/widgets/all_card.dart';
import 'package:flutter_finance_controller/src/features/day_by_day/shared/widgets/buttons_appbar.dart';
import 'package:flutter_finance_controller/src/features/day_by_day/shared/widgets/input_card.dart';
import 'package:flutter_finance_controller/src/features/day_by_day/shared/widgets/output_card.dart';

class DayPage extends StatefulWidget {
  const DayPage({Key? key}) : super(key: key);

  @override
  _DayPageState createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  final PageController _pageController = PageController();
  int screen = 0;
  void navigator({required int pageindex}) {
    _pageController.animateToPage(
      pageindex,
      duration: const Duration(milliseconds: 800),
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
              child: Icon(Icons.ac_unit),
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
          InputCard(),
          OutCard(),
          AllCard(),
        ],
      ),
    );
  }
}
