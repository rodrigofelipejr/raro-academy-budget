import '../../../shared/errors/failure.dart';

class TransactionError extends Failure {
  final String message;
  TransactionError({required this.message});
}

class DeleteTransactionError extends Failure {
  final String message;
  DeleteTransactionError({required this.message});
}

class CreateTransactionError extends Failure {
  final String message;
  CreateTransactionError({required this.message});
}

class UpdateTransactionError extends Failure {
  final String message;
  UpdateTransactionError({required this.message});
}

class LoadTransactionError extends Failure {
  final String message;
  LoadTransactionError({required this.message});
}
