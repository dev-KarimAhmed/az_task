
import 'package:az_task/core/animation/custom_slide_hrizontal.dart';
import 'package:az_task/core/common/widgets/spaces.dart';
import 'package:az_task/core/theme/app_colors.dart';
import 'package:az_task/features/dashboard/data/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridCard extends StatelessWidget {
  const CustomGridCard({
    super.key,
    required this.cardModel,
     this.duration,
  });
  final CardModel cardModel;
  final int? duration;

  @override
  Widget build(BuildContext context) {
    return CustomScaleAnimation(
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
