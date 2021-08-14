import '../models/item_menu.dart';

class Constants {
  static List<ItemMenu> menuItems = [
    ItemMenu(
      description: 'Perfil',
      type: TypeMenuItem.menu,
    ),
    ItemMenu(
      description: 'Cadastro',
      type: TypeMenuItem.subMenu,
    ),
    ItemMenu(type: TypeMenuItem.divider),
    ItemMenu(
      description: 'Conta',
      type: TypeMenuItem.menu,
    ),
    ItemMenu(
      description: 'Gerenciar cartões',
      type: TypeMenuItem.subMenu,
    ),
    ItemMenu(
      description: 'Investimento',
      type: TypeMenuItem.subMenu,
    ),
    ItemMenu(type: TypeMenuItem.divider),
    ItemMenu(
      description: 'Segurança',
      type: TypeMenuItem.menu,
    ),
    ItemMenu(
      description: 'Alterar senha',
      type: TypeMenuItem.subMenu,
    ),
    ItemMenu(type: TypeMenuItem.divider),
    ItemMenu(
      description: 'Outros',
      type: TypeMenuItem.menu,
    ),
    ItemMenu(
      description: 'Ajuda',
      type: TypeMenuItem.subMenu,
    ),
  ];
}
