import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/widgets/widgets.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/constants/constants.dart';
import 'stores/last_transactions_store.dart';

class LastTransactionsWidget extends StatefulWidget {
  const LastTransactionsWidget({Key? key}) : super(key: key);

  @override
  LatestTransactionsStateWidget createState() => LatestTransactionsStateWidget();
}

class LatestTransactionsStateWidget extends State<LastTransactionsWidget> {
  late final LastTransactionsStore _store;

  double get totalValueTransactions => _store.state.transactions.isNotEmpty
      ? _store.state.transactions.map((e) => e.value).reduce((p, c) => p + c)
      : 0.0;

  @override
  void initState() {
    _store = Modular.get<LastTransactionsStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      child: CardWidget(
        contentPadding: const EdgeInsets.only(),
        child: Observer(
          builder: (_) {
            return WrapperWidget(
              visible: _store.onError != null,
              overlay: TryAgainButtonWidget(
                onPressed: () => _store.handleTransactions(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
                            ButtonIconWidget(
                              onTap: () => Modular.to.pushNamed(AppRoutes.transactions, arguments: 2),
                              child: Icon(
                                Icons.navigate_next,
                                color: AppColors.roxo,
                                size: 32.0,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 6.0),
                          child: Text(
                            '${Formatters.formatMoney(totalValueTransactions)}',
                            style: AppTextStyles.gray24w400Roboto,
                          ),
                        ),
                        Text(
                          'No momento',
                          style: AppTextStyles.gray14w500Roboto,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: _store.state.transactions
                        .map((transaction) => ItemCardWidget(
                              prefixEnable: true,
                              transaction: transaction,
                              onTap: () =>
                                  Modular.to.pushNamed(AppRoutes.extTransactionsDetails, arguments: transaction),
                            ))
                        .toList(),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
