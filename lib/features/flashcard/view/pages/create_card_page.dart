import 'package:client/core/enums/word_type.dart';
import 'package:client/core/utils.dart';
import 'package:client/core/widgets/custom_appbar.dart';
import 'package:client/core/widgets/custom_dropdown.dart';
import 'package:client/features/flashcard/models/card_model.dart';
import 'package:client/features/flashcard/view/widgets/adjective_fields.dart';
import 'package:client/features/flashcard/view/widgets/noun_fields.dart';
import 'package:client/features/flashcard/view/widgets/prepositional_phrase_fields.dart';
import 'package:client/features/flashcard/view/widgets/verb_fields.dart';
import 'package:client/features/flashcard/viewmodel/flashcard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateCardPage extends ConsumerStatefulWidget {
  const CreateCardPage({super.key});

  @override
  ConsumerState<CreateCardPage> createState() => _CreateCardPageState();
}

class _CreateCardPageState extends ConsumerState<CreateCardPage> {
  WordType? selectedWordType;

  final TextEditingController greekController = TextEditingController();
  final TextEditingController englishController = TextEditingController();
  final TextEditingController exampleController = TextEditingController();
  final TextEditingController chapterController = TextEditingController();
  final TextEditingController endingController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController prepositionalCaseController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final isLoading = ref.watch(
            flashcardViewModelProvider.select((value) => value?.isLoading)) ==
        true;

    ref.listen(
      flashcardViewModelProvider,
      (_, next) {
        next?.when(
          data: (data) {
            Fluttertoast.showToast(
                msg: 'Card created for \'${greekController.text}\' successfully!',
                toastLength: Toast.LENGTH_LONG);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateCardPage(),
              ),
            );
          },
          error: (Object error, StackTrace stackTrace) {
            Fluttertoast.showToast(
                msg: '$error', toastLength: Toast.LENGTH_LONG);
          },
          loading: () {},
        );
      },
    );

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: CustomAppBar(
            title: 'Create Card',
            actions: selectedWordType != null
                ? [
                    IconButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          if (formKey.currentState!.validate()) {
                            await ref
                                .read(flashcardViewModelProvider.notifier)
                                .uploadCard(
                                  card: CardModel(
                                      greek: greekController.text,
                                      english: englishController.text,
                                      example: exampleController.text,
                                      wordType: selectedWordType!.toText(),
                                      chapter: chapterController.text,
                                      gender: genderController.text.isNotEmpty
                                          ? genderController.text
                                          : null,
                                      genitiveEnding:
                                          endingController.text.isNotEmpty
                                              ? endingController.text
                                              : null,
                                      prepositionalCase:
                                          prepositionalCaseController
                                                  .text.isNotEmpty
                                              ? prepositionalCaseController.text
                                              : null),
                                );
                          }
                        }
                      },
                      icon: Icon(
                        Icons.check,
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                  ]
                : null,
          ),
        ),
        body: isLoading
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      CustomDropdown(
                        hintText: 'Word Type',
                        items: WordType.values.map((e) {
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
                          WordType.values
                              .firstWhere((e) => e.toText() == value);

                          selectedWordType = WordType.values
                              .firstWhere((e) => e.toText() == value);
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Form(
                        key: formKey,
                        child: Builder(builder: (context) {
                          switch (selectedWordType) {
                            case WordType.verb:
                              {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((timeStamp) {
                                  endingController.clear();
                                });
                                genderController.clear();
                                prepositionalCaseController.clear();
                                return VerbFields(
                                  greekController: greekController,
                                  englishController: englishController,
                                  exampleController: exampleController,
                                  chapterController: chapterController,
                                );
                              }
                            case WordType.noun:
                              {
                                prepositionalCaseController.clear();
                                return NounFields(
                                  greekController: greekController,
                                  englishController: englishController,
                                  exampleController: exampleController,
                                  chapterController: chapterController,
                                  endingController: endingController,
                                  genderController: genderController,
                                );
                              }
                            case WordType.properNoun:
                              {
                                prepositionalCaseController.clear();
                                return NounFields(
                                  greekController: greekController,
                                  englishController: englishController,
                                  exampleController: exampleController,
                                  chapterController: chapterController,
                                  endingController: endingController,
                                  genderController: genderController,
                                );
                              }
                            case WordType.adjective:
                              {
                                genderController.clear();
                                prepositionalCaseController.clear();
                                return AdjectiveFields(
                                  greekController: greekController,
                                  englishController: englishController,
                                  exampleController: exampleController,
                                  chapterController: chapterController,
                                  endingController: endingController,
                                );
                              }
                            case WordType.prepositionalPhrase:
                              {
                                WidgetsBinding.instance
                                    // Stops the app from crashing when the ending controller is cleared here
                                    .addPostFrameCallback((timeStamp) {
                                  endingController.clear();
                                });
                                genderController.clear();
                                return PrepositionalPhraseFields(
                                  greekController: greekController,
                                  englishController: englishController,
                                  exampleController: exampleController,
                                  chapterController: chapterController,
                                  prepositionalCaseController:
                                      prepositionalCaseController,
                                );
                              }
                            default:
                              return Text(
                                'Select the word type',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              );
                          }
                        }),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
