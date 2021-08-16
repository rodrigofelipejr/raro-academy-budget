import 'package:budget/src/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'features/splash/splash_module.dart';
import 'features/home/home.dart';
import 'features/login/login_module.dart';
import 'features/transactions/transactions_module.dart';
import 'shared/constants/constants.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => AuthController),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(AppRoutes.initial, module: SplashModule()),
        ModuleRoute(AppRoutes.login, module: LoginModule()),
        ModuleRoute(AppRoutes.home, module: HomeModule()),
        ModuleRoute(AppRoutes.daily, module: TransactionsModule()),
        //TODO - incluir módulo (Daniel)
      ];
}
