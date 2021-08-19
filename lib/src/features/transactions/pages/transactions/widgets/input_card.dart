import 'package:budget/src/shared/constants/constants.dart';
import 'package:budget/src/shared/models/models.dart';
import 'package:budget/src/shared/utils/formatters.dart';
import 'package:budget/src/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InputCard extends StatelessWidget {
  List<TransactionModel> transaction;
  double value;

  InputCard({Key? key, required this.transaction, required this.value})
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
                                  onTap: () => Modular.to.pushNamed(
                                      AppRoutes.income,
                                      arguments: transaction),
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
                          '+${Formatters.formatMoney(value)}',
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
          ),
          SizedBox(height: sizeScreen.height * 0.05),
        ],
      ),
    );
  }
}
