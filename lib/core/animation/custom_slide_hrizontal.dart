
import 'package:flutter/material.dart';

class CustomSlideHorizontal extends StatefulWidget {
  const CustomSlideHorizontal({super.key, required this.child,  this.reverse = false});
  final Widget child;
  final bool reverse;
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
      duration: const Duration(milliseconds: 500),
    );
    position = Tween<Offset>(
      begin:  Offset(widget.reverse ?  1.0 : -1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: position, child: widget.child);
  }
}
