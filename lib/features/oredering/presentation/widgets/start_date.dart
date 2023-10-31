import 'package:flutter/material.dart';
import 'package:flutter_application_test_ordering/features/oredering/presentation/provider/provider.dart';

import 'package:flutter_application_test_ordering/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class StartDate extends StatelessWidget {
  const StartDate({super.key});

  @override
  Widget build(BuildContext context) {
    DateProvider dateProvider = context.read<DateProvider>();

    return Container(
      color: AppColors.elementBackgound,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Start date',
            style: Theme.of(context).textTheme.textFieldTitle,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: TextField(
              controller: dateProvider.dateController,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.buttonActiveBackgroundColor),
                ),
                contentPadding: EdgeInsets.all(12.r),
                prefixIcon: SvgPicture.asset(
                  'assets/images/calendar.svg',
                  fit: BoxFit.none,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(),
                ),
                hintText: 'Pick Date',
              ),
              readOnly: true,
              onTap: () {
                dateProvider.selectDate(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
