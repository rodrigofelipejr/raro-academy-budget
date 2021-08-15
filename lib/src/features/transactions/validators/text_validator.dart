import 'package:budget/src/features/transactions/widgets/dropdown_item_data.dart';

class Validators {
  String? validateName(String value) {
    return value.isEmpty ? "Preencha corretamente o nome!" : null;
  }

  String? validateNumber(String value) {
    if (value.isEmpty) {
      return "Preencha corretamente o valor!";
    }

    try {
      double.parse(value);
      return null;
    } catch (e) {
      return "Digite um número";
    }
  }

  String? validateTransactionCategory(DropdownItemData? item) {
    return item == null ? 'Campo obrigatório' : null;
  }
}
