import 'package:flutter_modular/flutter_modular.dart';

import 'daily_page.dart';
import '../../shared/constants/constants.dart';

class DailyModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => DailyPage()),
      ];
}
