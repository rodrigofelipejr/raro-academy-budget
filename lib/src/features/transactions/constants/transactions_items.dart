import '../../../shared/constants/constants.dart';
import '../widgets/widgets.dart';

class TransactionsItems {
  static final List<DropdownItemData> incomeItems = [
    DropdownItemData(
      color: AppColors.azul,
      value: AppStrings.dinheiro,
      key: TransactionCategories.money,
    ),
    DropdownItemData(
      color: AppColors.azul,
      value: AppStrings.pix,
      key: TransactionCategories.pix,
    ),
    DropdownItemData(
      color: AppColors.azul,
      value: AppStrings.doc,
      key: TransactionCategories.doc,
    ),
    DropdownItemData(
      color: AppColors.azul,
      value: AppStrings.ted,
      key: TransactionCategories.ted,
    ),
    DropdownItemData(
      color: AppColors.azul,
      value: AppStrings.boleto,
      key: TransactionCategories.ticket,
    ),
  ];

  static final List<DropdownItemData> expensesItems = [
    DropdownItemData(
      color: AppColors.amarelo,
      value: AppStrings.refeicao,
      key: TransactionCategories.meal,
    ),
    DropdownItemData(
      color: AppColors.verde,
      value: AppStrings.transporte,
      key: TransactionCategories.transport,
    ),
    DropdownItemData(
      color: AppColors.rosa,
      value: AppStrings.viagem,
      key: TransactionCategories.trip,
    ),
    DropdownItemData(
      color: AppColors.ciano,
      value: AppStrings.educacao,
      key: TransactionCategories.education,
    ),
    DropdownItemData(
      color: AppColors.roxo,
      value: AppStrings.pagamentos,
      key: TransactionCategories.payments,
    ),
    DropdownItemData(
      color: AppColors.gray,
      value: AppStrings.outros,
      key: TransactionCategories.others,
    ),
  ];
}
