import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';
import 'home.dart';
import 'widgets/widgets.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => HomeStore(i(), i(), i(), i())),
        Bind.lazySingleton((i) => GeneralBalanceStore(i(), i())),
        Bind.lazySingleton((i) => DailyStore(i(), i())),
        Bind.lazySingleton((i) => LastTransactionsStore(i(), i())),
        Bind.lazySingleton((i) => HomeRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => HomePage()),
      ];
}
