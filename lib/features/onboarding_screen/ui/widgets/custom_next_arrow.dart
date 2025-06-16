import 'package:az_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SmoothCircularProgressWithArrow extends StatefulWidget {
  final int currentPage;
  final int totalPages;
  final Color progressColor;
  final Color backgroundColor;
  final Color arrowColor;
  final VoidCallback onTap;

  const SmoothCircularProgressWithArrow({
    super.key,
    required this.currentPage,
    this.totalPages = 3,
    this.progressColor = AppColors.primary,
    this.backgroundColor = AppColors.secondary,
    required this.arrowColor,
    required this.onTap,
  });

  @override
  SmoothCircularProgressWithArrowState createState() =>
      SmoothCircularProgressWithArrowState();
}

class SmoothCircularProgressWithArrowState
    extends State<SmoothCircularProgressWithArrow> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // CircularProgressIndicator with smooth transition
          TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: 0.0,
              end: (widget.currentPage + 1) / widget.totalPages,
            ),
            duration: const Duration(
              milliseconds: 500,
            ), // Smooth transition duration
            builder: (context, value, child) {
              return SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  value: value,
                  color: widget.progressColor,
                  backgroundColor: widget.backgroundColor,
                  strokeWidth: 5.0,
                ),
              );
            },
          ),
          // Arrow icon in the center
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: widget.arrowColor,
            size: 40,
          ),
        ],
      ),
    );
  }
}