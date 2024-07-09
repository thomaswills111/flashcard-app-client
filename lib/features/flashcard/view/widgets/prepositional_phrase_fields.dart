import 'package:client/core/enums/gender.dart';
import 'package:client/core/enums/prepositional_case.dart';
import 'package:client/core/utils.dart';
import 'package:client/core/widgets/custom_dropdown.dart';
import 'package:client/core/widgets/custom_field.dart';
import 'package:flutter/material.dart';

class PrepositionalPhraseFields extends StatelessWidget {
  final TextEditingController greekController;
  final TextEditingController englishController;
  final TextEditingController exampleController;
  final TextEditingController chapterController;
  final TextEditingController prepositionalCaseController;

  PrepositionalPhraseFields({
    super.key,
    required this.greekController,
    required this.englishController,
    required this.exampleController,
    required this.chapterController,
    required this.prepositionalCaseController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomField(
          controller: greekController,
          hintText: 'Greek',
        ),
        const SizedBox(
          height: 16,
        ),
        CustomField(
          controller: englishController,
          hintText: 'English',
        ),
        const SizedBox(
          height: 16,
        ),
        CustomDropdown(
          hintText: 'Prepositional case',
          items: PrepositionalCase.values.map((e) {
            return DropdownMenuItem<String>(
              value: e.toText(),
              child: Center(
                child: Text(
                  e.toText(),
                ),
              ),
            );
          }).toList(),
          onChanged: (String? value) {
            PrepositionalCase.values.firstWhere((e) => e.toText() == value);
          },
        ),
        const SizedBox(
          height: 16,
        ),
        CustomField(
          controller: exampleController,
          hintText: 'Example',
          maxLines: 3,
        ),
        const SizedBox(
          height: 16,
        ),
        CustomField(
          controller: chapterController,
          hintText: 'Chapter',
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
