import 'package:budget/src/features/daily/daily_store.dart';
import 'package:budget/src/features/daily/repositories/daily_repository.dart';
import 'package:budget/src/features/daily/repositories/daily_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'daily_page.dart';
import '../../shared/constants/constants.dart';

class DailyModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind<IDailyRepository>(
            (i) => DailyRepository(FirebaseFirestore.instance)),
        Bind.lazySingleton((i) => DailyStore(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => DailyPage()),
      ];
}
