import 'package:flutter_modular/flutter_modular.dart';

import 'splash_page.dart';
import '../../shared/constants/constants.dart';

class SplashModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => SplashPage()),
      ];
}
