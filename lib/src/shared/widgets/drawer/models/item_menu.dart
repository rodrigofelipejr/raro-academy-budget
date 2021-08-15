enum TypeMenuItem { divider, menu, subMenu }

class ItemMenu {
  final TypeMenuItem type;
  final String? description;
  void Function()? onTap;

  ItemMenu({
    required this.type,
    this.description,
    this.onTap,
  });
}
