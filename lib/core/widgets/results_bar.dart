import 'package:client/features/flashcard/viewmodel/flashcard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// stanim for the snippet 

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double beginValue = 0;
  double endValue = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer( // Like a consumer but only tracks one variable; more efficient
      // selector: (_, notifier) => notifier.percentComplete,
      builder: (_, percentComplete, __) { // Converted to block body to add extra code

        // endValue = percentComplete;

        if(endValue == 0) { // If beginning a new round, begins directly at 0 so it doesn't animate to 0 from full
          beginValue = 0;
        }

        var animation = Tween<double>(begin: beginValue, end: endValue).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOutCirc));
        
        _controller.reset(); // reset because it will be run multiple times
        _controller.forward();
        beginValue = endValue; // set the new starting point to the previous end point at each step

        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: ClipRRect( // Doesn't round the indicator bar
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              minHeight: size.height * 0.03,
              value: animation.value,
            ),
          ),
                ),
        );
      },
    );
  }
}