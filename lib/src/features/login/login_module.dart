import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';
import 'page/login/login.dart';
import 'page/register/register_page.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => LoginStore(i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => LoginPage()),
        ChildRoute(AppRoutes.register, child: (_, args) => RegisterPage()),
      ];
}
