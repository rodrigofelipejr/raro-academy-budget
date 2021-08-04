import 'dart:developer';

import 'package:budget/src/app_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:budget/src/app_widget.dart';

class AppFirebase extends StatefulWidget {
  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          log(snapshot.toString());
          return Center(
            child: Text("Deu error no firebase"), //FIXME - criar Widget
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return ModularApp(module: AppModule(), child: AppWidget());
        }

        return Center(
          child: CircularProgressIndicator(), //FIXME - criar Widget
        );
      },
    );
  }
}
