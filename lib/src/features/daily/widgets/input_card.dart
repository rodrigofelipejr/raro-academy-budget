import 'package:budget/src/features/daily/daily_store.dart';
import 'package:budget/src/shared/utils/formatters.dart';
import 'package:budget/src/shared/widgets/item_card_widget.dart';
import 'package:flutter/material.dart';

class InputCard extends StatefulWidget {
  const InputCard({Key? key}) : super(key: key);

  @override
  _InputCardState createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  // late final DailyController _controller;

  // @override
  // void initState() {
  //   _controller = DailyController();
  //   super.initState();
  // }

  // late var listvalue = _controller.transactions.map((e) => e.value).toList();

  double sun(List list) {
    var soma = 0.0;
    for (var i = 0; i < list.length; i++) {
      soma += list[i];
    }
    return soma;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  // child: ListView(
                  //   children:
                  //   _controller.transactions
                  //       .map((transaction) => ItemCardWidget(
                  //             transaction: transaction,
                  //             onTap: () => null,
                  //           ))
                  //       .toList(),
                  // ),
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
                            'R\$'
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
    );
  }
}
