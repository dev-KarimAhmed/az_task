import 'package:az_task/core/extensions/navigation_extenstion.dart';
import 'package:az_task/core/routes/app_routes.dart';
import 'package:az_task/features/dashboard/data/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHeroIcon extends StatelessWidget {
  const CustomHeroIcon({super.key, required this.cardModel});

  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => context.pushNamed(
            AppRoutes.screenDetailsHero,
            arguments: cardModel,
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
    );
  }
}
