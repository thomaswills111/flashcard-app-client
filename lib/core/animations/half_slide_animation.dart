import 'package:client/core/enums/slide_direction.dart';
import 'package:flutter/material.dart';

class HalfSlideAnimation extends StatefulWidget {
  HalfSlideAnimation({
    super.key,
    required this.child,
    required this.direction,
    this.animationCompleted,
    this.animate = false,
  });
  final Widget child;
  SlideDirection direction;
  bool animate;
  final VoidCallback? animationCompleted;

  @override
  State<HalfSlideAnimation> createState() => _HalfSlideAnimationState();
}

class _HalfSlideAnimationState extends State<HalfSlideAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    super.initState();
  }

  // Can trigger the animation again if the widget is updated
  @override
  didUpdateWidget(covariant oldWidget) {
    if (widget.animate == true) {
      _animationController.forward();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final Animation<Offset> _animation;
    Tween<Offset> tween;

    switch (widget.direction) {
      case SlideDirection.leftAway:
        tween = Tween<Offset>(
            begin: const Offset(0, 0), end: const Offset(-0.4, 0));
        break;
      case SlideDirection.leftIn:
        tween = Tween<Offset>(
            begin: const Offset(-0.4, 0), end: const Offset(0.0, 0));
        break;
      default:
        tween =
            Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 0));
        break;
    }

    // _animationController.dispose();

    // _animationController = AnimationController(
    //     vsync: this, duration: const Duration(milliseconds: 400));

    print('duration: ${_animationController.duration}');

    _animation = tween.animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
