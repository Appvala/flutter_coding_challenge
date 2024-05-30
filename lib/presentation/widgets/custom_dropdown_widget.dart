import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String hint;
  final T? value;
  final List<T> items;
  final String Function(T) getItemLabel;
  final String Function(T item) getDropDownItemValue;
  final void Function(T?) onChanged;

  const CustomDropdown({
    super.key,
    required this.hint,
    required this.value,
    required this.items,
    required this.getItemLabel,
    required this.getDropDownItemValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<T>(
        hint: Text(hint),
        value: value,
        isExpanded: true,
        underline: const SizedBox(),
        items: items.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(getItemLabel(item)),
          );
        }).toList(),
        onChanged: onChanged,
        icon: const Icon(Icons.keyboard_arrow_down),
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
