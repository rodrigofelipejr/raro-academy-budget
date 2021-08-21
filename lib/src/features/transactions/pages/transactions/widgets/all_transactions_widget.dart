import 'package:flutter/material.dart';

import '../../../../../shared/constants/constants.dart';
import '../../../../../shared/models/models.dart';
import '../../../../../shared/utils/utils.dart';
import '../../../../../shared/widgets/widgets.dart';

class AllTransactionsWidget extends StatelessWidget {
  final List<TransactionModel> transactions;
  final double totalValue;

  AllTransactionsWidget({
    Key? key,
    required this.transactions,
    required this.totalValue,
  }) : super(key: key);

  bool get positiveValue => totalValue > 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Padding(
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
                          children: transactions
                              .map((transaction) => ItemCardWidget(
                                    transaction: transaction,
                                    onTap: () => null,
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    Divider(height: 1),
                    Container(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: AppTextStyles.purple16w500Roboto,
                          ),
                          Text(
                            positiveValue
                                ? '+${Formatters.formatMoney(totalValue)}'
                                : '-${Formatters.formatMoney(totalValue)}',
                            style: AppTextStyles.blue14w500Roboto.copyWith(
                              color: positiveValue ? AppColors.greenLight : AppColors.redLight,
                            ),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
            SpaceBottomWidget()
          ],
        ),
      ),
    );
  }
}
