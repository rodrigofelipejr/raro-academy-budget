import '../widgets/dropdown_item_data.dart';
import '/src/shared/constants/app_colors.dart';

class DropdownController {
  DropdownItemData? value;

  final List<DropdownItemData> _items = [
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

  DropdownController();

  List<DropdownItemData> get items => _items;
}
