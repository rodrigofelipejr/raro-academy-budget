class GeneralBalanceState {
  final double value;
  GeneralBalanceState({this.value = 0.0});

  GeneralBalanceState copyWith({
    double? value,
  }) {
    return GeneralBalanceState(
      value: value ?? this.value,
    );
  }
}
