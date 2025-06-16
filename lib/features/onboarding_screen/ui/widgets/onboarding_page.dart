import 'package:az_task/core/animation/custom_fade_animation.dart';
import 'package:az_task/core/animation/custom_slide_animation.dart';
import 'package:az_task/core/common/widgets/spaces.dart';
import 'package:az_task/core/extensions/navigation_extenstion.dart';
import 'package:az_task/core/routes/app_routes.dart';
import 'package:az_task/core/theme/app_colors.dart';
import 'package:az_task/features/onboarding_screen/ui/widgets/custom_next_arrow.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.currentPage,
    required this.pageController,
  });
  final String imagePath;
  final String title;
  final String subtitle;
  final int currentPage;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        CustomFadeInAnimation(
          milliDuration: 400,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(imagePath),
                verticalSpace(16),
                Text(
                  textAlign: TextAlign.center,
                  title,
                  style: TextTheme.of(
                    context,
                  ).titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                verticalSpace(16),
                Text(
                  textAlign: TextAlign.center,
                  subtitle,
                  style: TextTheme.of(
                    context,
                  ).titleMedium?.copyWith(fontWeight: FontWeight.w400),
                ),
                verticalSpace(114),
              ],
            ),
          ),
        ),
        CustomSlideAnimation(
          child: SmoothCircularProgressWithArrow(
            currentPage: currentPage,
            totalPages: 3,
            arrowColor: AppColors.primary,
            onTap: () {
              if (currentPage < 2) {
                pageController.animateToPage(
                  currentPage + 1,

                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeIn,
                );
              } else if (currentPage == 2) {
                context.pushNamed(AppRoutes.lastView);
              }
            },
          ),
        ),
      ],
    );
  }
}
