import 'package:budget/src/features/login/pages/onboarding/onboarding_page.dart';
import 'package:budget/src/features/login/pages/register/register_store.dart';
import 'package:budget/src/features/login/repositories/login_repository_impl.dart';
import 'package:budget/src/features/login/repositories/register_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';
import 'pages/pages.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => RegisterRepository(i())),
        Bind.lazySingleton((i) => RegisterStore(i(), i())),
        Bind.singleton((i) => FirebaseFirestore.instance),
        Bind.singleton((i) => LoginStore(i(), i(), i())),
        Bind.lazySingleton((i) => LoginRepositoryImpl(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => LoginPage()),
        ChildRoute(AppRoutes.register, child: (_, args) => RegisterPage()),
        ChildRoute(AppRoutes.onboarding, child: (_, args) => OnboardingPage()),
      ];
}
