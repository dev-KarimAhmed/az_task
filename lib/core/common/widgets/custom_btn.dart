import 'dart:ffi';

import 'package:az_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.width, this.height, this.onPressed, required this.child});

  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final Widget child ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 300.w,
      height: height ?? 55.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
