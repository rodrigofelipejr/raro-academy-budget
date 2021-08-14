import '../../../../shared/models/models.dart';

class LastTransactionsState {
  final List<TransactionModel> transactions;

  LastTransactionsState({this.transactions = const []});

  LastTransactionsState copyWith({
    List<TransactionModel>? transactions,
  }) {
    return LastTransactionsState(
      transactions: transactions ?? this.transactions,
    );
  }
}
