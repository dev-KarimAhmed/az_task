import 'package:flutter/material.dart';

class CustomSlideHorizontal extends StatefulWidget {
  const CustomSlideHorizontal({
    super.key,
    required this.child,
    this.reverse = false,
    this.duration = 500,
  });
  final Widget child;
  final bool reverse;
  final int duration;
  @override
  State<CustomSlideHorizontal> createState() => _CustomSlideHorizontalState();
}

class _CustomSlideHorizontalState extends State<CustomSlideHorizontal>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> position;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );
    position = Tween<Offset>(
      begin: Offset(widget.reverse ? -1 : 1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: position, child: widget.child);
  }
}

class CustomScaleAnimation extends StatefulWidget {
  const CustomScaleAnimation({
    super.key,
    required this.child,
    this.duration = 400,
  });
  final Widget child;
  final int duration;
  @override
  State<CustomScaleAnimation> createState() => _CustomScaleAnimationState();
}

class _CustomScaleAnimationState extends State<CustomScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );
    scale = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: scale, child: widget.child);
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }
}
