import 'package:budget/src/features/transactions/widgets/dropdown_item_data.dart';
import 'package:budget/src/shared/constants/constants.dart';

class TransactionsItems {
  static final List<DropdownItemData> incomeItems = [
    DropdownItemData(
      color: AppColors.azul,
      value: "Dinheiro",
    ),
    DropdownItemData(
      color: AppColors.azul,
      value: "Pix",
    ),
    DropdownItemData(
      color: AppColors.azul,
      value: "Doc",
    ),
    DropdownItemData(
      color: AppColors.azul,
      value: "Ted",
    ),
    DropdownItemData(
      color: AppColors.azul,
      value: "Boleto",
    ),
  ];

  static final List<DropdownItemData> expensesItems = [
    DropdownItemData(
      color: AppColors.amarelo,
      value: "Refeição",
    ),
    DropdownItemData(
      color: AppColors.verde,
      value: "Transporte",
    ),
    DropdownItemData(
      color: AppColors.rosa,
      value: "Viagem",
    ),
    DropdownItemData(
      color: AppColors.ciano,
      value: "Educação",
    ),
    DropdownItemData(
      color: AppColors.roxo,
      value: "Pagamentos",
    ),
    DropdownItemData(
      color: AppColors.gray,
      value: "Outros",
    ),
  ];
}
