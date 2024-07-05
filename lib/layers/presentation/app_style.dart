import 'package:flutter/material.dart';
import 'app_colors.dart';


abstract class AppStyle {


  static const TextStyle textStyleBlack = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w800,
    fontSize: 16,
    color: AppColors.blackColor,
  );

  static const TextStyle appBarTextStyle = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: AppColors.greyColor,
  );
  static const TextStyle tapBarTextStyle = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );

  static const TextStyle textStyleButton = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w400,
    fontSize: 20,
    color: Color.fromRGBO(255, 255, 255, 1),
  );

  static const TextStyle textFieldStyle = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.greyColor,
  );

  static const TextStyle enableFeelingCardStyle = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: Colors.white,
  );
  static const TextStyle disableFeelingCardStyle = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: AppColors.blackColor,
  );
  static const TextStyle textSliderStyle = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: AppColors.sliderTextColor,
  );
  static const TextStyle textMonthStyle = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: AppColors.blackColor,
  );
  static const TextStyle textYearStyle = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppColors.greyColor,
  );
  static const TextStyle textDayStyle = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: AppColors.blackColor,
  );
}
