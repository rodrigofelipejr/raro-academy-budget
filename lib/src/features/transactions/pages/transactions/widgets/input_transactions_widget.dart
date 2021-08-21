import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/constants/constants.dart';
import '../../../../../shared/models/models.dart';
import '../../../../../shared/utils/formatters.dart';
import '../../../../../shared/widgets/widgets.dart';

class InputTransactionsWidget extends StatelessWidget {
  final List<TransactionModel> transactions;
  final double totalValue;

  const InputTransactionsWidget({
    Key? key,
    required this.transactions,
    required this.totalValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        children: transactions
                            .map((transaction) => ItemCardWidget(
                                  transaction: transaction,
                                  onTap: () => Modular.to.pushNamed(AppRoutes.income, arguments: transaction),
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
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total saída',
                          style: AppTextStyles.purple16w500Roboto,
                        ),
                        Text(
                          '+${Formatters.formatMoney(totalValue)}',
                          style: AppTextStyles.blue14w500Roboto.copyWith(
                            color: AppColors.greenLight,
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
    );
  }
}
