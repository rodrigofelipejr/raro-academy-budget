import '../../../shared/errors/failure.dart';

class TransactionError extends Failure {
  final String message;
  TransactionError({required this.message});
}

class DeleteTransactionError extends Failure {
  final String message;
  DeleteTransactionError({required this.message});
}
