import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/app_firebase.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(AppFirebase()),
  );
}
