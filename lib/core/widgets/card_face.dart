import 'package:flashcard_app_tutorial/animations/half_flip_animation.dart';
import 'package:flashcard_app_tutorial/animations/slide_animation.dart';
import 'package:flashcard_app_tutorial/configs/constants.dart';
import 'package:flashcard_app_tutorial/notifiers/flashcards_notifier.dart';
import 'package:flashcard_app_tutorial/utils/methods.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../enums/slide_direction.dart';

class CardFace extends StatelessWidget {
  const CardFace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FlashcardsNotifier>(
      builder: (_, notifier, __) => GestureDetector(
        onDoubleTap: () {
          notifier.setIgnoreTouch(
              ignore: true); // While the card is flipping, ignore touches
          notifier.runFlipCard1();
        },
        child: HalfFlipAnimation(
          animate: notifier.flipCard1,
          reset: notifier.resetFlipCard1,
          flipFromHalfway: false,
          animationCompleted: () {
            notifier.resetCard1();
            notifier.runFlipCard2();
          },
          child: SlideAnimation(
            animationDelay: 200,
            animationCompleted: () {
              notifier.setIgnoreTouch(ignore: false);
            },
            reset: notifier.resetSlideCard1,
            animate: notifier.slideCard1 &&
                !notifier
                    .isRoundCompleted, // This will run when the slideCard method goes off
            direction: SlideDirection.upIn,
            child: Center(
              child: Container(
                  width: size.width * 0.90,
                  height: size.height * 0.70,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(kCircularBorderRadius),
                      color: Theme.of(context).primaryColor,
                      border: Border.all(
                        color: Theme.of(context).highlightColor,
                        width: 5,
                      )),
                  child: Center(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(36.0),
                            child: Text(
                              notifier.word1.greek,
                              style: TextStyle(
                                  fontFamily: GoogleFonts.notoSans().fontFamily,
                                  fontSize: 36),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(notifier.word1.gender != null
                                  ? notifier.word1.gender!.toArticle()
                                  : '' ),//'(+${notifier.word1.prepositionalCase!.toText()})',),
                            )),
                        Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(''),//notifier.word1.genitiveEnding != null ?? notifier.word1.genitiveEnding),//'(+${notifier.word1.prepositionalCase!.toText()})',),
                            )),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18, right: 18),
                            child: SizedBox(
                              // If this doesn't work make it a sizedbox. Will resize if the text is too long to fit/big
                              width: double.infinity,
                              height: double.infinity,
                              child: Center(
                                child: Text('"${notifier.word1.example}"',
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.notoSans().fontFamily,
                                        fontSize: 24)),
                              ),
                            ),
                          ),
                        ),
                        // Expanded(
                        //     flex: 1,
                        //     child: Center(
                        //       child: Text(notifier.word1.gender != null
                        //           ? notifier.word1.gender!.toText()
                        //           : '' ),//'(+${notifier.word1.prepositionalCase!.toText()})',),
                        //     ))
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}