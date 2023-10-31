import 'package:flutter/material.dart';
import 'package:flutter_application_test_ordering/theme/app_colors.dart';
import 'package:flutter_application_test_ordering/theme/light_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextStepButton extends StatelessWidget {
  const NextStepButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      width: MediaQuery.of(context).size.width,
      height: 52.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36.r),
            ),
            backgroundColor: AppColors.buttonActiveBackgroundColor),
        onPressed: () {},
        child: Text(
          "Next Step",
          style: Theme.of(context).textTheme.activeButtonText,
        ),
      ),
    );
  }
}
