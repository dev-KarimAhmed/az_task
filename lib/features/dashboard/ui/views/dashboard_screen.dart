import 'package:az_task/core/animation/custom_fade_animation.dart';
import 'package:az_task/core/common/widgets/spaces.dart';
import 'package:az_task/core/common/widgets/theme_toggle_switch.dart';
import 'package:az_task/core/images/assets_images.dart';
import 'package:az_task/core/theme/app_colors.dart';
import 'package:az_task/features/dashboard/data/card_model.dart';
import 'package:az_task/features/dashboard/data/list_cards.dart';
import 'package:az_task/features/dashboard/ui/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(AssetsImages.person),
                        radius: 20,
                      ),
                      horizontalSpace(20),
                      Text(
                        "Welcome to AZ",
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ThemeToggleSwitch(),
                ],
              ),
              verticalSpace(24),
              Expanded(
                child: ListView.builder(
                  itemBuilder:
                      (context, index) => CustomCard(
                        cardModel: cardList[index],
                        isRevresed: index % 2 == 0,
                      ),
                  itemCount: cardList.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white, size: 32),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            context: context,
            builder:
                (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                    itemBuilder:
                        (_, index) => CustomGridCard(
                          cardModel: cardList[index],
                          isRevresed: index % 2 == 0,
                        ),
                    itemCount: cardList.length,
                  ),
                ),
          );
        },
      ),
    );
  }
}

class CustomGridCard extends StatelessWidget {
  const CustomGridCard({
    super.key,
    required this.cardModel,
    required this.isRevresed,
  });
  final CardModel cardModel;
  final bool isRevresed;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInAnimation(
      milliDuration: 600,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                cardModel.title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              verticalSpace(8),
              Text(
                cardModel.subtitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              verticalSpace(16),
              Text(
                cardModel.count,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: cardModel.iconColor,
                  fontSize: 28,
                ),
              ),
              verticalSpace(16),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.success.withAlpha(80),
                  borderRadius: BorderRadius.circular(64),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        cardModel.percentage,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.success,
                        ),
                      ),
                      Icon(
                        Icons.arrow_outward_outlined,
                        color: AppColors.success,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
