
import 'package:az_task/core/common/widgets/spaces.dart';
import 'package:az_task/features/dashboard/data/card_model.dart';
import 'package:flutter/material.dart';

class HeroScreenDetails extends StatelessWidget {
  const HeroScreenDetails({super.key, required this.cardModel});

  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          verticalSpace(100),
          Hero(
            tag: cardModel,
            child: Container(
              padding: const EdgeInsets.all(16),

              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: cardModel.iconColor.withAlpha(55),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(cardModel.icon, color: cardModel.iconColor, size: 60),
            ),
          ),
          verticalSpace(50),
          Center(
            child: Column(
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
              ],
            ),
          ),
          verticalSpace(50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cardModel.count,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: cardModel.iconColor,
                  fontSize: 28,
                ),
              ),
              horizontalSpace(8),
              Text(
                cardModel.percentage,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: cardModel.iconColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
