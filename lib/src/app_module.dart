import 'package:budget/src/features/daily/daily_module.dart';
import 'package:budget/src/features/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'features/splash/splash_module.dart';
import 'features/login/login_module.dart';
import 'shared/constants/constants.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(AppRoutes.initial, module: SplashModule()),
        ModuleRoute(AppRoutes.login, module: LoginModule()),
        ModuleRoute(AppRoutes.home, module: HomeModule()),
        ModuleRoute(AppRoutes.daily, module: DailyModule()),
      ];
}
