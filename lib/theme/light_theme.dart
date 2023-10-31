import 'package:flutter/material.dart';
import 'package:flutter_application_test_ordering/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ligthTheme = ThemeData(
  dividerTheme: DividerThemeData(
    thickness: 0.5.h,
    color: Colors.grey,
  ),
  colorScheme: const ColorScheme.light(
    primary: AppColors.buttonActiveBackgroundColor,
  ),
  listTileTheme: ListTileThemeData(
    textColor: AppColors.cartTextColor,
    titleTextStyle: TextStyle(
      color: AppColors.cartTextColor,
      fontSize: 14.sp,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
    ),
    subtitleTextStyle: TextStyle(
      color: AppColors.cartTextColor,
      fontSize: 14.sp,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: 15.w,
      vertical: 5.h,
    ),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: AppColors.backgoundColor,
    titleTextStyle: TextStyle(
      color: AppColors.textColor,
      fontSize: 20.sp,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
    ),
  ),
  datePickerTheme: const DatePickerThemeData(
    headerBackgroundColor: AppColors.buttonActiveBackgroundColor,
  ),
);

extension CustomStyles on TextTheme {
  TextStyle get stepTitle {
    return TextStyle(
      color: AppColors.textColor,
      fontSize: 16.sp,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      letterSpacing: 0.16.sp,
    );
  }

  TextStyle get moduleTitle {
    return TextStyle(
      color: AppColors.textColor,
      fontSize: 16.sp,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get textFieldTitle {
    return TextStyle(
      color: AppColors.textColor,
      fontSize: 14.sp,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get activeButtonText {
    return TextStyle(
      color: AppColors.buttonActiveTextColor,
      fontSize: 14.sp,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get disabledButtonText {
    return TextStyle(
      color: AppColors.buttonDisabledTextColor,
      fontSize: 14.sp,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get hintColor {
    return TextStyle(
      color: AppColors.hinColor,
      fontSize: 14.sp,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get addAdress {
    return const TextStyle(
      color: AppColors.buttonActiveBackgroundColor,
      fontSize: 16,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
    );
  }
}
