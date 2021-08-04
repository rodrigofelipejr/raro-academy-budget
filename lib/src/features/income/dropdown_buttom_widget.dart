import 'package:flutter/material.dart';
import 'package:flutter_finance_controller/src/features/income/dropdown_item_data.dart';

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
          style: TextStyle(
            fontFamily: 'roboto',
            color: Colors.blue.withOpacity(0.54),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
          ),
        ),
      ),
      value: value,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 8,
      style: TextStyle(
        color: Colors.blue.withOpacity(0.54),
        fontFamily: 'roboto',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.15,
      ),
      underline: Container(
        height: 1,
        color: Colors.blue.withOpacity(0.42),
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
              style: TextStyle(
                fontFamily: 'roboto',
                color: Colors.blue.withOpacity(0.54),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.15,
              ),
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
                style: TextStyle(
                  fontFamily: 'roboto',
                  color: Colors.blue.withOpacity(0.87),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.15,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
