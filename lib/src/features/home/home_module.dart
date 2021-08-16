import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';
import 'home.dart';
import 'repositories/repositories.dart';
import 'home_store.dart';
import 'widgets/widgets.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => HomeRepository()),
        Bind.lazySingleton((i) => GeneralBalanceStore(i())),
        Bind.lazySingleton((i) => DailyStore(i())),
        Bind.lazySingleton((i) => LastTransactionsStore(i())),
        Bind.lazySingleton((i) => HomeStore(i(), i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => HomePage()),
      ];
}
