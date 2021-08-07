import '../../shared/models/models.dart';

class HomeState {
  final double generalBalance;
  final double dailyBalance;
  final double inputs;
  final double outputs;
  final String selectedMonth;
  final List<TransactionModel> transactions;

  HomeState({
    this.generalBalance = 0.0,
    this.dailyBalance = 0.0,
    this.inputs = 0.0,
    this.outputs = 0.0,
    this.selectedMonth = '', //TODO - mês atual por default
    this.transactions = const [],
  });

  HomeState copyWith({
    double? generalBalance,
    double? dailyBalance,
    double? inputs,
    double? outputs,
    String? selectedMonth,
    List<TransactionModel>? transactions,
  }) {
    return HomeState(
      generalBalance: generalBalance ?? this.generalBalance,
      dailyBalance: dailyBalance ?? this.dailyBalance,
      inputs: inputs ?? this.inputs,
      outputs: outputs ?? this.outputs,
      selectedMonth: selectedMonth ?? this.selectedMonth,
      transactions: transactions ?? this.transactions,
    );
  }
}
