import 'package:flutter/material.dart';

class CustomFadeInAnimation extends StatefulWidget {
  const CustomFadeInAnimation({
    super.key,
    this.milliDuration = 300,
    required this.child,
  });
  final Widget child;
  final int milliDuration;

  @override
  State<CustomFadeInAnimation> createState() => _CustomFadeInAnimationState();
}

class _CustomFadeInAnimationState extends State<CustomFadeInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacity;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    opacity = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: opacity, child: widget.child);
  }
}
