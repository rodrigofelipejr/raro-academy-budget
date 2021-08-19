import 'package:budget/src/features/transactions/widgets/dropdown_item_data.dart';
import 'package:budget/src/shared/constants/constants.dart';

class TransactionsItems {
  static final List<DropdownItemData> incomeItems = [
    DropdownItemData(
      color: AppColors.azul,
      value: "Dinheiro",
      key: "money",
    ),
    DropdownItemData(
      color: AppColors.azul,
      value: "Pix",
      key: "pix",
    ),
    DropdownItemData(
      color: AppColors.azul,
      value: "Doc",
      key: "doc",
    ),
    DropdownItemData(
      color: AppColors.azul,
      value: "Ted",
      key: "ted",
    ),
    DropdownItemData(
      color: AppColors.azul,
      value: "Boleto",
      key: "ticket",
    ),
  ];

  static final List<DropdownItemData> expensesItems = [
    DropdownItemData(
      color: AppColors.amarelo,
      value: "Refeição",
      key: "meal",
    ),
    DropdownItemData(
      color: AppColors.verde,
      value: "Transporte",
      key: "transport",
    ),
    DropdownItemData(
      color: AppColors.rosa,
      value: "Viagem",
      key: "trip",
    ),
    DropdownItemData(
      color: AppColors.ciano,
      value: "Educação",
      key: "education",
    ),
    DropdownItemData(
      color: AppColors.roxo,
      value: "Pagamentos",
      key: "payments",
    ),
    DropdownItemData(
      color: AppColors.gray,
      value: "Outros",
      key: "others",
    ),
  ];
}
