import 'package:client/core/enums/gender.dart';
import 'package:client/core/utils.dart';
import 'package:client/core/widgets/custom_dropdown.dart';
import 'package:client/core/widgets/custom_field.dart';
import 'package:flutter/material.dart';

class VerbFields extends StatelessWidget {
  final TextEditingController greekController;
  final TextEditingController englishController;
  final TextEditingController exampleController;
  final TextEditingController chapterController;

  VerbFields({
    super.key,
    required this.greekController,
    required this.englishController,
    required this.exampleController,
    required this.chapterController,
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
        const Text('Submit')
      ],
    );
  }
}
