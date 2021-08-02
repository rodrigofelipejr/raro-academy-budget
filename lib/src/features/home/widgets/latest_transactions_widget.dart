import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';
import '../../../shared/models/models.dart';
import '../../../shared/utils/utils.dart';
import '../../../shared/constants/constants.dart';

class LatestTransactionsWidget extends StatefulWidget {
  final List<TransactionModel> transactions;

  const LatestTransactionsWidget({Key? key, required this.transactions}) : super(key: key);

  @override
  LatestTransactionsStateWidget createState() => LatestTransactionsStateWidget();
}

class LatestTransactionsStateWidget extends State<LatestTransactionsWidget> {
  double get totalValueTransactions => widget.transactions.map((e) => e.value).reduce((p, c) => p + c);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      child: CardWidget(
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
                Icon(
                  Icons.navigate_next,
                  color: AppColors.roxo,
                  size: 32.0,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: Text(
                'R\$ ${Formatters.formatMoney(totalValueTransactions)}',
                style: AppTextStyles.gray24w400Roboto,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              'No momento',
              style: AppTextStyles.gray14w500Roboto,
            ),
            SizedBox(height: 14.0),
            Column(
              children: widget.transactions.map((transaction) => ItemCardWidget(transaction: transaction)).toList(),
            )
          ],
        ),
      ),
    );
  }
}
