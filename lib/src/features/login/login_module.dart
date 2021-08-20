import 'package:budget/src/features/login/pages/register/register_controller.dart';
import 'package:budget/src/features/login/pages/register/repositories/register_repositories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../shared/constants/constants.dart';
import 'login.dart';
import 'pages/register/register_page.dart'; //TODO - rever

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => RegisterRepository(i())),
        Bind.lazySingleton((i) => RegisterController(i(), i())),
        Bind.singleton((i) => FirebaseFirestore.instance),
        Bind.singleton((i) => LoginStore(i(), i(), i())),
        Bind.lazySingleton((i) => LoginRepositoryImpl(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => LoginPage()),
        ChildRoute(AppRoutes.register, child: (_, args) => RegisterPage()),
      ];
}
