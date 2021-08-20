import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';
import 'pages/pages.dart';
import 'pages/register/repositories/register_repository.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => RegisterRepository(i())),
        Bind.lazySingleton((i) => RegisterController(i(), i())),
        Bind.singleton((i) => LoginStore(i(), i(), i())),
        Bind.lazySingleton((i) => LoginRepositoryImpl(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => LoginPage()),
        ChildRoute(AppRoutes.register, child: (_, args) => RegisterPage()),
      ];
}
