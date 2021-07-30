import 'package:flutter/material.dart';
import 'package:flutter_finance_controller/src/features/home/widgets/item_card_widget.dart';

import 'card_widget.dart';
import '../../../shared/constants/constants.dart';

class LatestTransactionsWidget extends StatefulWidget {
  final List<dynamic> transactions; //FIXME - criar model

  const LatestTransactionsWidget({Key? key, required this.transactions}) : super(key: key);

  @override
  LatestTransactionsStateWidget createState() => LatestTransactionsStateWidget();
}

class LatestTransactionsStateWidget extends State<LatestTransactionsWidget> {
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
                'R\$ 398,30',
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
              children: widget.transactions.map((e) => ItemCardWidget()).toList(),
            )
          ],
        ),
      ),
    );
  }
}
