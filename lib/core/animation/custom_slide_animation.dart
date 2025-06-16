
import 'package:flutter/material.dart';

class CustomSlideAnimation extends StatefulWidget {
  const CustomSlideAnimation({super.key, required this.child,  this.milliDuration = 300});

  final Widget child;
  final int milliDuration;

  @override
  State<CustomSlideAnimation> createState() => _CustomSlideAnimationState();
}

class _CustomSlideAnimationState extends State<CustomSlideAnimation> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> position;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration:  Duration(milliseconds: widget.milliDuration),
    );
    position = Tween<Offset>(
      begin: const Offset(0.0, 2.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );
    animationController.forward();
  }

 

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: position, child: widget.child);
  }
}