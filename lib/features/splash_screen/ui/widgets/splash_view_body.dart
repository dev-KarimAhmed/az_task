import 'package:az_task/core/common/widgets/spaces.dart';
import 'package:az_task/core/extensions/navigation_extenstion.dart';
import 'package:az_task/core/routes/app_routes.dart';
import 'package:az_task/features/splash_screen/ui/widgets/fade_animation_image.dart';
import 'package:az_task/features/splash_screen/ui/widgets/slide_animation_text.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    initAnimation();
    goToHome();
  }

  void goToHome() {
    Future.delayed(const Duration(milliseconds: 1800), () {
      // ignore: use_build_context_synchronously
      context.pushReplacmentNamed(AppRoutes.onboardingScreen);
    });
  }

  @override
  void dispose() {
    // Dispose of the animation controller
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FadeAnimationImage(fadeAnimation: fadeAnimation),
        verticalSpace(8),
        SlidingAnimationText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController);

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController);

    animationController.forward();
  }
}
