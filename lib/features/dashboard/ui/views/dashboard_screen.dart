import 'package:az_task/core/common/widgets/spaces.dart';
import 'package:az_task/features/dashboard/ui/widgets/cards_list_view.dart';
import 'package:az_task/features/dashboard/ui/widgets/dashboard_floating_action_btn.dart';
import 'package:az_task/features/dashboard/ui/widgets/dashboard_header.dart';
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
            children: [DashboardHeader(), verticalSpace(24), CardsListView()],
          ),
        ),
      ),
      floatingActionButton: DashboardFloatingActionBtn(),
    );
  }
}
