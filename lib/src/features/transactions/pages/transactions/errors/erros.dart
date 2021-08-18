abstract class Failure implements Exception {
  String get message;
}

class TransActionError extends Failure {
  final String message;
  TransActionError({required this.message});
}
