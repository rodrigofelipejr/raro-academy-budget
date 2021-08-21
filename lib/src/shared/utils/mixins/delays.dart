import 'dart:async';

mixin Delays {
  void delayDefault<T>(FutureOr<T> Function(dynamic) callback) async {
    Future.delayed(Duration(milliseconds: 300)).then(callback);
  }
}
