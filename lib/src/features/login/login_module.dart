import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';
import 'login.dart';
import 'pages/register/register_page.dart'; //TODO - rever

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => LoginStore(i(), i(), i())),
        Bind.lazySingleton((i) => LoginRepositoryImpl(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => LoginPage()),
        ChildRoute(AppRoutes.register, child: (_, args) => RegisterPage()),
      ];
}
