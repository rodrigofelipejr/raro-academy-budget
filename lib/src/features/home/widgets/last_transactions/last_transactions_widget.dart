import 'package:flutter/material.dart';

import '../../../../shared/widgets/widgets.dart';
import '../../../../shared/models/models.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/constants/constants.dart';

class LastTransactionsWidget extends StatefulWidget {
  final List<TransactionModel> transactions;

  const LastTransactionsWidget({Key? key, required this.transactions}) : super(key: key);

  @override
  LatestTransactionsStateWidget createState() => LatestTransactionsStateWidget();
}

class LatestTransactionsStateWidget extends State<LastTransactionsWidget> {
  double get totalValueTransactions =>
      widget.transactions.isNotEmpty ? widget.transactions.map((e) => e.value).reduce((p, c) => p + c) : 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      child: CardWidget(
        contentPadding: const EdgeInsets.only(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Últimas transações',
                        style: AppTextStyles.purple20w500Roboto,
                      ),
                      ButtonIconWidget(
                        onTap: () => null,
                        child: Icon(
                          Icons.navigate_next,
                          color: AppColors.roxo,
                          size: 32.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 6.0),
                    child: Text(
                      'R\$ ${Formatters.formatMoney(totalValueTransactions)}',
                      style: AppTextStyles.gray24w400Roboto,
                    ),
                  ),
                  Text(
                    'No momento',
                    style: AppTextStyles.gray14w500Roboto,
                  ),
                ],
              ),
            ),
            Column(
              children: widget.transactions
                  .map((transaction) => ItemCardWidget(
                        transaction: transaction,
                        onTap: () => null,
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
