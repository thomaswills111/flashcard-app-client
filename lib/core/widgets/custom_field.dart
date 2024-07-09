import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final int maxLines;
  const CustomField(
      {super.key, required this.hintText, required this.controller, this.maxLines=1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(24),
          hintText: hintText,
        ),
        maxLines: maxLines,
        validator: (value) {
          if (value!.trim().isEmpty) {
            return '$hintText is missing!';
          }
          return null;
        });
  }
}
