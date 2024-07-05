import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class Constants {
  static const shadow = [
    BoxShadow(
      color: AppColors.shadowColor,
      offset: Offset(2, 4),
      blurRadius: 10.8,
      spreadRadius: 0,
    ),
  ];
}
