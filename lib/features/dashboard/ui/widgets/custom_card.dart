import 'package:az_task/core/animation/custom_slide_hrizontal.dart';
import 'package:az_task/core/common/widgets/spaces.dart';
import 'package:az_task/core/theme/app_colors.dart';
import 'package:az_task/features/dashboard/data/card_model.dart';
import 'package:az_task/features/dashboard/ui/views/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.cardModel,
    required this.isRevresed,
    required this.duration,
  });
  final CardModel cardModel;
  final bool isRevresed;
  final int duration;
  @override
  Widget build(BuildContext context) {
    return CustomSlideHorizontal(
      duration: duration,
      reverse: isRevresed,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                HeroScreenDetails(cardModel: cardModel),
                      ),
                    ),
                child: Hero(
                  tag: cardModel,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16),
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: cardModel.iconColor.withAlpha(55),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(cardModel.icon, color: cardModel.iconColor),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    cardModel.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.success.withAlpha(80),
                      borderRadius: BorderRadius.circular(64),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            cardModel.percentage,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
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
            ],
          ),
        ),
      ),
    );
  }
}
