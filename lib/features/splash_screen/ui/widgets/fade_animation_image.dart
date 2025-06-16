
import 'package:az_task/core/images/assets_images.dart';
import 'package:flutter/material.dart';

class FadeAnimationImage extends StatelessWidget {
  const FadeAnimationImage({
    super.key,
    required this.fadeAnimation,
  });

  final Animation<double> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
    
      child: const Image(image: AssetImage(AssetsImages.logo), height: 150),
    );
  }
}
