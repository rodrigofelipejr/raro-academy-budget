import 'package:budget/src/shared/constants/app_routes.dart';
import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:budget/src/shared/models/models.dart';
import 'package:budget/src/shared/utils/formatters.dart';
import 'package:budget/src/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AllCard extends StatelessWidget {
  List<TransactionModel> transaction;
  double value;
  AllCard({Key? key, required this.transaction, required this.value}) : super(key: key);

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
                                      transaction.type.index == 0 ? AppRoutes.expenses : AppRoutes.income,
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
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total', style: AppTextStyles.blue16w500Roboto),
                        Text(
                            value >= 0
                                ? '+${Formatters.formatMoney(value.abs())}'
                                : '-${Formatters.formatMoney(value.abs())}',
                            style: value >= 0 ? AppTextStyles.green14w500Roboto : AppTextStyles.red14w500Roboto),
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
