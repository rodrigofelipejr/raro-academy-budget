import 'package:budget/src/features/transactions/pages/expenses/expenses_page.dart';
import 'package:budget/src/features/transactions/pages/income/income_page.dart';
import 'package:budget/src/features/transactions/pages/transactions/transactions_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';
import 'pages/transactions/repositories/transactions_repository.dart';
import 'pages/transactions/transactions_page.dart';

class TransactionsModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => TransactionsRepository(i())),
        Bind.singleton((i) => TransactionsStore(i.get())),
        Bind.singleton((i) => FirebaseFirestore.instance),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => TransactionsPage()),
        ChildRoute(AppRoutes.income, child: (_, args) => IncomePage()),
        ChildRoute(AppRoutes.expenses, child: (_, args) => ExpensesPage()),
      ];
}
