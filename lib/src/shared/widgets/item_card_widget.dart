import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../utils/utils.dart';
import '../models/models.dart';

class ItemCardWidget extends StatelessWidget {
  final TransactionModel transaction;

  const ItemCardWidget({Key? key, required this.transaction}) : super(key: key);

  String get prefix => transaction.type.index == 0 ? '+' : '-';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      onTap: () {},
      leading: SizedBox(
        height: 40.0,
        child: CircleAvatar(
          backgroundColor: AppColors.amarelo,
          child: SizedBox(
            height: 20.0,
            child: Image.asset(
              AppImages.icTransport,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Text(
        transaction.description,
        style: AppTextStyles.purple16w500Roboto,
      ),
      subtitle: Text(
        Formatters.dateParsing(transaction.date),
        style: AppTextStyles.gray14w400Roboto,
      ),
      trailing: Text(
        '${prefix}R\$ ${transaction.value}',
        style: AppTextStyles.black16w400Roboto,
      ),
    );
  }
}
