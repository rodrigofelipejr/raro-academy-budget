import 'package:budget/src/shared/constants/constants.dart';
import 'package:budget/src/shared/models/models.dart';
import 'package:budget/src/shared/utils/formatters.dart';
import 'package:budget/src/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OutputTransactionsWidget extends StatelessWidget {
  final List<TransactionModel> transactions;
  final double totalValue;

  OutputTransactionsWidget({
    Key? key,
    required this.transactions,
    required this.totalValue,
  }) : super(key: key);

  bool get positiveValue => totalValue > 0.0;

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
                                  onTap: () => Modular.to.pushNamed(AppRoutes.expenses, arguments: transaction),
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
                          'Total sáida',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 52, 48, 144)),
                        ),
                        Text(
                          '-${Formatters.formatMoney(totalValue)}',
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
          SpaceBottomWidget(),
        ],
      ),
    );
  }
}
