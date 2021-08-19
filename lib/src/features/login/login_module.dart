import 'package:budget/src/features/login/page/login/login_controller.dart';
import 'package:budget/src/features/login/page/register/register_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';
import 'page/login/login_page.dart';
import 'page/register/register_page.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => LoginController()),
        Bind.lazySingleton((i) => RegisterController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => LoginPage()),
        ChildRoute(AppRoutes.register, child: (_, args) => RegisterPage()),
      ];
}
