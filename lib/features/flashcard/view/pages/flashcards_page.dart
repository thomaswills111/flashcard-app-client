import 'package:client/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({super.key});

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) { // postframe callback prevents an exception
    //   final flashcardNotifier = Provider.of<FlashcardsNotifier>(context, listen: false); // Happens once when the page is opened
    //   flashcardNotifier.runSlideCard1();
    //   flashcardNotifier.generateAllSelectedWords();
    //   flashcardNotifier.generateCurrentWord(context: context);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56), // 56 is the standard size
          child: CustomAppBar(title: 'Flashcards',),
        ),
        body: IgnorePointer( // Its children ignore all touch events
        // ignoring: notifier.ignoreTouches,
          child: const Stack(children: [ // The cards are on top of each other
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   // child: ProgressBar(),
            //   // ),
            // Card2(),
            // Card1(),
            ]
            ), 
        ),
      );
  }
}