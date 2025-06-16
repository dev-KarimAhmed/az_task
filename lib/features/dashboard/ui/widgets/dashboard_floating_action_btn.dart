
import 'package:az_task/core/theme/app_colors.dart';
import 'package:az_task/features/dashboard/data/list_cards.dart';
import 'package:az_task/features/dashboard/ui/widgets/custom_grid_card.dart';
import 'package:flutter/material.dart';

class DashboardFloatingActionBtn extends StatelessWidget {
  const DashboardFloatingActionBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primary,
      child: const Icon(
        Icons.dataset_outlined,
        color: Colors.white,
        size: 32,
      ),
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
    );
  }
}
