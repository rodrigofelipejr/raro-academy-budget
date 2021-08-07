import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';
import 'home_page.dart';
import 'home_store.dart';
import 'repositories/home_repository.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => HomeRepository()),
        Bind.lazySingleton((i) => HomeStore(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => HomePage()),
      ];
}
