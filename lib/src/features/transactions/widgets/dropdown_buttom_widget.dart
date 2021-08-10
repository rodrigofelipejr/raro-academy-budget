import 'package:flutter/material.dart';

import 'dropdown_item_data.dart';
import 'text_styles.dart';

class DropdownButtomWidget extends StatelessWidget {
  const DropdownButtomWidget({
    Key? key,
    this.value,
    this.items,
    this.focusNode,
    this.onChanged,
  }) : super(key: key);

  final DropdownItemData? value;
  final List<DropdownItemData>? items;
  final FocusNode? focusNode;
  final ValueChanged<DropdownItemData?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      hint: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          "Escolha",
          style: TextStyles.black16w400RobotoOp54,
        ),
      ),
      value: value,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 8,
      style: TextStyles.black16w400RobotoOp54,
      underline: Container(
        height: 1,
        color: Colors.black.withOpacity(0.42),
      ),
      onChanged: onChanged,
      focusNode: focusNode,
      selectedItemBuilder: (BuildContext context) {
        return items!
        .map<DropdownMenuItem<DropdownItemData>>((DropdownItemData item) {
          return DropdownMenuItem<DropdownItemData>(
            value: item,
            child: Text(
              item.value,
              style: TextStyles.black16w400RobotoOp87,
            ),
          );
        }).toList();
      },
      items: items!
      .map<DropdownMenuItem<DropdownItemData>>((DropdownItemData item) {
        return DropdownMenuItem<DropdownItemData>(
          value: item,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(right: 12.0),
                height: 24.0,
                width: 24.0,
                decoration: BoxDecoration(
                  color: item.color,
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                item.value,
                style: TextStyles.black16w400RobotoOp87,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
