import 'package:az_task/core/common/widgets/spaces.dart';
import 'package:az_task/core/common/widgets/theme_toggle_switch.dart';
import 'package:az_task/core/images/assets_images.dart';
import 'package:az_task/core/theme/app_colors.dart';
import 'package:az_task/features/dashboard/data/card_model.dart';
import 'package:az_task/features/dashboard/data/list_cards.dart';
import 'package:az_task/features/dashboard/ui/widgets/custom_card.dart';
import 'package:az_task/features/dashboard/ui/widgets/custom_grid_card.dart';
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
                      GestureDetector(
                        // onTap:
                        //     () => Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder:
                        //             (context) =>
                        //                 const HeroScreenDetails(id: "avatar"),
                        //       ),
                        //     ),
                        child: Hero(
                          transitionOnUserGestures: true,
                          tag: "avatar",
                          child: CircleAvatar(
                            backgroundImage: AssetImage(AssetsImages.person),
                            radius: 20,
                          ),
                        ),
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
                        duration: (index + 2) * 180,
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
                        (_, index) =>
                            CustomGridCard(cardModel: cardList[index]),
                    itemCount: cardList.length,
                  ),
                ),
          );
        },
      ),
    );
  }
}

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
