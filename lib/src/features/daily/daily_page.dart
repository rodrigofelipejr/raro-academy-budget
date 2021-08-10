import 'package:budget/src/features/daily/widgets/all_card.dart';
import 'package:budget/src/features/daily/widgets/buttons_appbar.dart';
import 'package:budget/src/features/daily/widgets/input_card.dart';
import 'package:budget/src/features/daily/widgets/output_card.dart';
import 'package:budget/src/features/home/widgets/daily/month_selector_widget.dart';
import 'package:flutter/material.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({Key? key}) : super(key: key);

  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
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
              child: MonthSelectorWidget(label: "agosto"),
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
