
import 'package:az_task/core/theme/app_colors.dart';
import 'package:az_task/features/dashboard/data/card_model.dart';
import 'package:flutter/material.dart';

List<CardModel> cardList = [
  CardModel(
    title: "Orders",
    subtitle: "New Order Today",
    icon: Icons.shopping_cart,
    iconColor: AppColors.primary,
    count: "1,234",
    percentage: "+65%",
  ),
  CardModel(
    title: "Customers",
    subtitle: "New Customers Today",
    icon: Icons.person,
    iconColor: AppColors.warning,
    count: "234",
    percentage: "+23%",
  ),
  CardModel(
    title: "Messages",
    subtitle: "New Messages Today",
    icon: Icons.message,
    iconColor: AppColors.error,
    count: "45",
    percentage: "+53%",
  ),
  CardModel(
    title: "Sales",
    subtitle: "New Sales Today",
    icon: Icons.attach_money,
    iconColor: AppColors.accent,
    count: "23",
    percentage: "+78%",
  ),
];
