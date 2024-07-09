import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<DropdownMenuItem<String>> items;
  final String hintText;
  final Function(String?) onChanged;
  const CustomDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.all(24),
      ),
      validator: (value) {
        if (value == null) {
          return '$hintText is missing!';
        }
        return null;
      },
      items: items,
      onChanged: onChanged,
      value: null,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
        fontSize: 16
      ),
      dropdownColor: Theme.of(context).colorScheme.background,
    );
  }
}
