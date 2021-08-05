import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';
import 'page/login/login_page.dart';
import 'page/register/register_page.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => LoginPage()),
        ChildRoute(AppRoutes.register, child: (_, args) => RegisterPage()),
      ];
}
