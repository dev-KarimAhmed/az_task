
import 'package:flutter/material.dart';

class CardModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final String count;
  final String percentage;

  CardModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.count,
    required this.percentage,
  });
}
