import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../utils/utils.dart';
import '../models/models.dart';

class ItemCardWidget extends StatelessWidget {
  final TransactionModel transaction;
  final void Function() onTap;

  const ItemCardWidget({
    Key? key,
    required this.transaction,
    required this.onTap,
  }) : super(key: key);

  String get prefix => transaction.type.index == 0 ? '+' : '-';
  Map get mapCategoryImageColors => TransactionCategories.mapCategoryImageColors.values
      .elementAt(CategoryTransaction.values.indexOf(transaction.category));
  Color get backgroundColor => mapCategoryImageColors.entries.first.value;
  String get asset => mapCategoryImageColors.entries.first.key;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      onTap: onTap,
      leading: SizedBox(
        height: 40.0,
        child: CircleAvatar(
          backgroundColor: backgroundColor,
          child: SizedBox(
            height: 20.0,
            child: Image.asset(asset, fit: BoxFit.cover),
          ),
        ),
      ),
      title: Text(
        transaction.description,
        style: AppTextStyles.purple16w500Roboto,
      ),
      subtitle: Text(
        Formatters.dateParsing(transaction.createAt),
        style: AppTextStyles.gray14w400Roboto,
      ),
      trailing: Text(
        '${prefix}R\$ ${transaction.value}',
        style: AppTextStyles.black16w400Roboto,
      ),
    );
  }
}
