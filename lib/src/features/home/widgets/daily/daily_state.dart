class DailyState {
  final double dailyBalance;
  final double inputs;
  final double outputs;
  final DateTime date;

  DailyState({
    this.dailyBalance = 0.0,
    this.inputs = 0.0,
    this.outputs = 0.0,
    required this.date,
  });

  DailyState copyWith({
    double? dailyBalance,
    double? inputs,
    double? outputs,
    DateTime? date,
  }) {
    return DailyState(
      dailyBalance: dailyBalance ?? this.dailyBalance,
      inputs: inputs ?? this.inputs,
      outputs: outputs ?? this.outputs,
      date: date ?? this.date,
    );
  }

  @override
  String toString() {
    return 'DailyState(dailyBalance: $dailyBalance, inputs: $inputs, outputs: $outputs, date: $date)';
  }
}
