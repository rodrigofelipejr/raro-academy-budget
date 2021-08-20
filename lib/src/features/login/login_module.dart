import 'package:budget/src/features/login/page/login/login_controller.dart';
import 'package:budget/src/features/login/page/register/register_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';
import 'page/login/login_page.dart';
import 'page/register/register_page.dart';
import 'page/register/repositories/register_repository.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => RegisterRepository(i())),
        Bind.singleton((i) => LoginController()),
        Bind.lazySingleton((i) => RegisterController(i())),
        Bind.singleton((i) => FirebaseFirestore.instance),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => LoginPage()),
        ChildRoute(AppRoutes.register, child: (_, args) => RegisterPage()),
      ];
}
