import 'package:flutter/material.dart';

import '../../../../../shared/constants/constants.dart';
import '../../../../../shared/models/models.dart';
import '../../../../../shared/utils/utils.dart';
import '../../../../../shared/widgets/widgets.dart';

class CardTransactionsWidget extends StatelessWidget {
  final List<TransactionModel> transactions;
  final double total;
  final String label;
  final void Function(TransactionModel transaction) onTap;
  final void Function(String docId) onLongPress;
  final Color? totalColor;
  final String? fixedPrefix;

  const CardTransactionsWidget({
    Key? key,
    required this.total,
    required this.label,
    required this.transactions,
    required this.onTap,
    required this.onLongPress,
    this.totalColor,
    this.fixedPrefix,
  }) : super(key: key);

  Color get color => totalColor ?? colorBasedOnValue;
  String get prefix => fixedPrefix ?? prefixBasedOnValue;

  Color get colorBasedOnValue => (total == 0.0)
      ? AppColors.black54
      : (total >= 0.0)
          ? AppColors.greenLight
          : AppColors.redLight;

  String get prefixBasedOnValue => (total == 0.0)
      ? ''
      : (total > 0.0)
          ? '+'
          : '-';

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
                      child: transactions.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.notes,
                                    size: 36.0,
                                    color: AppColors.lightGray,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: Text(
                                      'Sem transações',
                                      style: AppTextStyles.grayLight16w500Roboto,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : ListView(
                              children: transactions
                                  .map((transaction) => ItemCardWidget(
                                        transaction: transaction,
                                        onTap: () => onTap(transaction),
                                        onLongPress: () => onLongPress(transaction.id!),
                                      ))
                                  .toList(),
                            ),
                    ),
                  ),
                  Divider(height: 1),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          label,
                          style: AppTextStyles.purple16w500Roboto,
                        ),
                        Text(
                          '$prefix${Formatters.formatMoney(total.abs())}',
                          style: AppTextStyles.blue14w500Roboto.copyWith(color: color),
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
