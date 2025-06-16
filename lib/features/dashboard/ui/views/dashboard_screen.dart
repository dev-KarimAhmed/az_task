import 'package:az_task/core/common/widgets/spaces.dart';
import 'package:az_task/core/common/widgets/theme_toggle_switch.dart';
import 'package:az_task/core/images/assets_images.dart';
import 'package:az_task/features/dashboard/data/list_cards.dart';
import 'package:az_task/features/dashboard/ui/widgets/custom_card.dart';
import 'package:flutter/material.dart';

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
    );
  }
}
