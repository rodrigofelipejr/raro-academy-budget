import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';
import 'splash.dart';

class SplashModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => SplashStore(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => SplashPage()),
      ];
}
