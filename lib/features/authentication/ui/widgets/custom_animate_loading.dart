
import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatefulWidget {
  /// The size of the circular progress indicator.
  /// If flutter_screenutil is used, consider using .w and .h for responsiveness.
  final double spinnerSize;

  /// The color of the circular progress indicator.
  final Color spinnerColor;

  /// The text displayed next to the spinner.
  final String loadingText;

  /// The color of the loading text.
  final Color textColor;

  /// The font size of the loading text.
  final double? textSize;

  /// The width of the space between the spinner and the text.
  final double spacing;

  const CustomLoadingIndicator({
    super.key,
    this.spinnerSize = 20.0,
    this.spinnerColor = Colors.white,
    this.loadingText = "Please Wait",
    this.textColor = Colors.white,
    this.textSize = 16.0,
    this.spacing = 8.0,
  });

  @override
  State<CustomLoadingIndicator> createState() => _CustomLoadingIndicatorState();
}

class _CustomLoadingIndicatorState extends State<CustomLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _dotAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller for the ellipsis dots.
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // Cycle through dots every 2 second
    )..repeat(
      period: Duration(seconds: 2),
    ); // Repeat the animation indefinitely

    // Define the animation for the dots (0 to 3 dots).
    _dotAnimation = IntTween(begin: 0, end: 3).animate(_controller);
  }

  @override
  void dispose() {
    // Dispose the animation controller to prevent memory leaks.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizedBox to control the size of the CircularProgressIndicator.
        SizedBox(
          height: widget.spinnerSize,
          width: widget.spinnerSize,
          child: CircularProgressIndicator(
            color: widget.spinnerColor,
            strokeWidth: 2, // Default stroke width for the spinner
          ),
        ),
        // Add horizontal space between the spinner and the text.
        SizedBox(width: widget.spacing),
        // AnimatedBuilder to update the text with dots dynamically.
        AnimatedBuilder(
          animation: _dotAnimation,
          builder: (context, child) {
            String dots = '.' * _dotAnimation.value;
            return Text(
              "${widget.loadingText}$dots",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: widget.textColor,
                fontSize: widget.textSize,
              ),
            );
          },
        ),
      ],
    );
  }
}
