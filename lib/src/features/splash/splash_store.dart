import 'package:mobx/mobx.dart';

import '../../shared/stores/stores.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase extends BaseStore with Store {
  @override
  Future<void> init() async {}
}
