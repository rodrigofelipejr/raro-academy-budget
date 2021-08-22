import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';
import 'pages/pages.dart';
import 'repositories/repositories.dart';

class TransactionsModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => TransactionsRepositoryImpl(i())),
        Bind.singleton((i) => TransactionsStore(i(), i(), i())),
        Bind.singleton((i) => IncomeStore(i(), i())),
        Bind.singleton((i) => ExpensesStore(i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => TransactionsPage(indexPage: args.data)),
        ChildRoute(AppRoutes.income, child: (_, args) => IncomePage(data: args.data)),
        ChildRoute(AppRoutes.expenses, child: (_, args) => ExpensesPage(data: args.data)),
      ];
}
