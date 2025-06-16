
import 'package:az_task/features/dashboard/data/list_cards.dart';
import 'package:az_task/features/dashboard/ui/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class CardsListView extends StatelessWidget {
  const CardsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder:
            (context, index) => CustomCard(
              duration: (index + 2) * 180,
              cardModel: cardList[index],
              isRevresed: index % 2 == 0,
            ),
        itemCount: cardList.length,
      ),
    );
  }
}
