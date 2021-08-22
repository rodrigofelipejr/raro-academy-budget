import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';
import 'transactions.dart';

class TransactionsModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => TransactionsRepositoryImpl(i())),
        Bind.lazySingleton((i) => TransactionsListStore(i(), i(), i())),
        Bind.lazySingleton((i) => TransactionsDetailsStore(i(), i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.transactionsList, child: (_, args) => TransactionsListPage(tabIndex: args.data)),
        ChildRoute(AppRoutes.transactionsDetails, child: (_, args) => TransactionsDetailsPage(transaction: args.data)),
      ];
}
