import 'package:budget/src/features/transactions/pages/expenses/expenses_page.dart';
import 'package:budget/src/features/transactions/pages/income/income_page.dart';
import 'package:budget/src/features/transactions/pages/transactions/transactions_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';
import 'pages/expenses/expenses_store.dart';
import 'pages/income/income_store.dart';
import 'pages/transactions/transactions_page.dart';
import 'repositories/transactions_repository.dart';

class TransactionsModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => TransactionsRepository(i())),
        Bind.singleton((i) => TransactionsStore(i(), i())),
        Bind.singleton((i) => IncomeStore(i())),
        Bind.singleton((i) => ExpensesStore(i())),
        Bind.singleton((i) => FirebaseFirestore.instance),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => TransactionsPage()),
        ChildRoute(AppRoutes.income,
            child: (_, args) => IncomePage(
                  data: args.data,
                )),
        ChildRoute(AppRoutes.expenses,
            child: (_, args) => ExpensesPage(
                  data: args.data,
                )),
      ];
}
