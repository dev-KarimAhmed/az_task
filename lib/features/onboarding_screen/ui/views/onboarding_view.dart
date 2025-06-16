import 'package:az_task/core/extensions/navigation_extenstion.dart';
import 'package:az_task/core/images/assets_images.dart';
import 'package:az_task/core/routes/app_routes.dart';
import 'package:az_task/core/theme/app_colors.dart';
import 'package:az_task/features/onboarding_screen/ui/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (int index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [
                OnboardingPage(
                  pageController: pageController,
                  currentPage: currentPage,
                  imagePath: AssetsImages.onboardingImage,
                  title: "AZ Is Your Success Partner",
                  subtitle:
                      "In AZ we provide you the best services for your needs",
                ),
                OnboardingPage(
                  pageController: pageController,
                  currentPage: currentPage,
                  imagePath: AssetsImages.onboardingImage,
                  title: "AZ Is Your Success Partner",
                  subtitle:
                      "In AZ We Can Market , trade , develop and Success !",
                ),
                OnboardingPage(
                  pageController: pageController,
                  currentPage: currentPage,
                  imagePath: AssetsImages.onboardingImage,
                  title: "AZ Is Your Success Partner",
                  subtitle: "In AZ , Hope You Enjoy Our Services",
                ),
              ],
            ),
            Positioned(
              top: 15,
              right: 15,
              child:
                  currentPage < 2
                      ? TextButton(
                        onPressed:
                            () => context.pushReplacmentNamed(
                              AppRoutes.loginScreen,
                            ),
                        child: Text(
                          "Skip",
                          style: TextTheme.of(context).bodyLarge?.copyWith(
                            decoration: TextDecoration.underline,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                      : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
