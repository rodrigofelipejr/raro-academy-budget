import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/models.dart';
import '../utils/utils.dart';

class ItemCardWidget extends StatelessWidget {
  final TransactionModel transaction;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final bool prefixEnable;

  const ItemCardWidget({
    Key? key,
    required this.transaction,
    this.onTap,
    this.prefixEnable = false,
    this.onLongPress,
  }) : super(key: key);

  Map get mapCategoryImageColors =>
      TransactionCategories.mapCategoryImageColors[transaction.category] ??
      TransactionCategories.mapCategoryImageColors[TransactionCategories.others]!;

  Color get backgroundColor => mapCategoryImageColors.entries.first.value;
  String get asset => mapCategoryImageColors.entries.first.key;
  String get prefix => transaction.type.index == 0 ? '+' : '-';
  TextStyle get style => prefixEnable
      ? AppTextStyles.black16w400Roboto
      : AppTextStyles.black16w400Roboto.copyWith(
          color: AppColors.roxo,
        );
  Text get trailing => Text(
        '${prefixEnable ? prefix : ''} ${Formatters.formatMoney(transaction.value)}',
        style: style,
      );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      onTap: onTap,
      onLongPress: onLongPress,
      leading: SizedBox(
        height: 40.0,
        child: CircleAvatar(
          backgroundColor: backgroundColor,
          child: SizedBox(
            height: 20.0,
            width: 20.0,
            child: Image.asset(asset, fit: BoxFit.contain),
          ),
        ),
      ),
      title: Text(
        transaction.description != null
            ? '${TransactionCategories.translate[transaction.category]} - ${transaction.description}'
            : transaction.category,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: AppTextStyles.purple16w500Roboto,
      ),
      subtitle: Text(
        Formatters.dateParsing(transaction.createAt),
        style: AppTextStyles.gray14w400Roboto,
      ),
      trailing: trailing,
    );
  }
}
