import 'package:budget/src/shared/models/models.dart';
import 'package:budget/src/shared/utils/formatters.dart';
import 'package:budget/src/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OutCard extends StatelessWidget {
  List<TransactionModel> transaction;
  double value;

  OutCard({Key? key, required this.transaction, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: CardWidget(
              contentPadding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ListView(
                        children: transaction
                            .map((transaction) => ItemCardWidget(
                                  transaction: transaction,
                                  onTap: () => null,
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total sáida',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 52, 48, 144)),
                        ),
                        Text(
                          '-${Formatters.formatMoney(value)}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 244, 67, 54)),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
          SizedBox(height: sizeScreen.height * 0.05),
        ],
      ),
    );
  }
}
