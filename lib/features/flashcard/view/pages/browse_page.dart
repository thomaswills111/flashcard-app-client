import 'package:client/core/widgets/custom_appbar.dart';
import 'package:client/core/widgets/custom_drawer.dart';
import 'package:client/features/flashcard/models/card_model.dart';
import 'package:client/features/flashcard/viewmodel/flashcard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrowsePage extends ConsumerStatefulWidget {
  const BrowsePage({super.key});

  @override
  ConsumerState<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends ConsumerState<BrowsePage> {
  late List<CardModel> _cardSearchResults = [];

  @override
  void initState() {
    _cardSearchResults = ref.read(flashcardViewModelProvider.notifier).allCards;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(flashcardViewModelProvider, (_, next) {
      next?.when(
          data: (data) {
            setState(() {});
          },
          error: (error, st) {},
          // loading isn't handled here because it can't return the loading widget
          loading: () {});
    });
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: CustomAppBar(
          title: 'Browse Words',
        ),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => _filterCards(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _cardSearchResults.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text(
                              _cardSearchResults[index].greek,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            Text('  ${_cardSearchResults[index].english}',
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic)),
                          ]),
                          Text('"${_cardSearchResults[index].example}"')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // body: Text(
    //   '${notifier.cards.length}',
    //   style: TextStyle(color: Colors.black),
  }

  _filterCards(String value) {
    // FlashcardsNotifier notifier = Provider.of<FlashcardsNotifier>(context, listen: false);
    FlashcardViewModel notifier = ref.read(flashcardViewModelProvider.notifier);
    List<CardModel> searchResults = [];
    if (value.isEmpty) {
      searchResults = notifier.allCards;
    } else {
      searchResults = notifier.allCards.where((element) =>
      element.english.toLowerCase().contains(value.toLowerCase())
      || element.greek.toLowerCase().contains(value.toLowerCase())).toList();
    }

    setState(() {
      _cardSearchResults = searchResults;
    });
  }
}
