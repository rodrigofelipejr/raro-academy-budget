import '../../../shared/errors/failure.dart';

class GeneralBalanceError extends Failure {
  final String message;
  GeneralBalanceError({required this.message});
}

class DailyError extends Failure {
  final String message;
  DailyError({required this.message});
}

class LastTransactionError extends Failure {
  final String message;
  LastTransactionError({required this.message});
}

class InternalError implements Failure {
  final String message;
  InternalError({required this.message});
}
