import '../../../shared/constants/constants.dart';
import '../widgets/widgets.dart';

class TransactionsItems {
  static final List<DropdownItemData> incomeItems = [
    DropdownItemData(
      image: AppImages.icPayments,
      color: AppColors.azul,
      value: AppStrings.dinheiro,
      key: TransactionCategories.money,
    ),
    DropdownItemData(
      image: AppImages.icPix,
      color: AppColors.azul,
      value: AppStrings.pix,
      key: TransactionCategories.pix,
    ),
    DropdownItemData(
      image: AppImages.icDoc,
      color: AppColors.azul,
      value: AppStrings.doc,
      key: TransactionCategories.doc,
    ),
    DropdownItemData(
      image: AppImages.icTed,
      color: AppColors.azul,
      value: AppStrings.ted,
      key: TransactionCategories.ted,
    ),
    DropdownItemData(
      image: AppImages.icBoleto,
      color: AppColors.azul,
      value: AppStrings.boleto,
      key: TransactionCategories.ticket,
    ),
  ];

  static final List<DropdownItemData> expensesItems = [
    DropdownItemData(
      image: AppImages.icMeal,
      color: AppColors.amarelo,
      value: AppStrings.refeicao,
      key: TransactionCategories.meal,
    ),
    DropdownItemData(
      image: AppImages.icTransport,
      color: AppColors.verde,
      value: AppStrings.transporte,
      key: TransactionCategories.transport,
    ),
    DropdownItemData(
      image: AppImages.icTrip,
      color: AppColors.rosa,
      value: AppStrings.viagem,
      key: TransactionCategories.trip,
    ),
    DropdownItemData(
      image: AppImages.icEducation,
      color: AppColors.ciano,
      value: AppStrings.educacao,
      key: TransactionCategories.education,
    ),
    DropdownItemData(
      image: AppImages.icPayments,
      color: AppColors.roxo,
      value: AppStrings.pagamentos,
      key: TransactionCategories.payments,
    ),
    DropdownItemData(
      image: AppImages.icOthers,
      color: AppColors.gray,
      value: AppStrings.outros,
      key: TransactionCategories.others,
    ),
  ];
}
