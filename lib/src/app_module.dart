import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'features/daily/daily_module.dart';
import 'features/home/home.dart';
import 'features/login/login_module.dart';
import 'features/splash/splash_module.dart';
import 'shared/constants/constants.dart';
import 'shared/repositories/auth/auth_repository.dart';
import 'shared/stores/auth/auth_store.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => AuthStore(i(), i())),
        Bind.singleton((i) => AuthRepository(i())),
        Bind.singleton((i) => FirebaseAuth.instance),
        Bind.singleton((i) => FirebaseFirestore.instance),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(AppRoutes.splash, module: SplashModule()),
        ModuleRoute(AppRoutes.login, module: LoginModule()),
        ModuleRoute(AppRoutes.home, module: HomeModule()),
        ModuleRoute(AppRoutes.daily, module: DailyModule()),
        //TODO - incluir módulo (Daniel)
      ];
}
