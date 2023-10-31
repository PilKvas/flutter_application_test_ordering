import 'package:flutter/material.dart';
import 'package:flutter_application_test_ordering/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      required this.textFieldTitle,
      required this.hintText,
      required this.prefixIconPath,
      this.keyboardType,
      this.validator,
      this.onChanged});

  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final String prefixIconPath;
  final String textFieldTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textFieldTitle,
            style: Theme.of(context).textTheme.textFieldTitle,
          ),
          SizedBox(
            height: 5.h,
          ),
          TextFormField(
            onChanged: onChanged,
            validator: validator,
            keyboardType: keyboardType,
            controller: controller,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors
                        .buttonActiveBackgroundColor), // Цвет подсветки при активации
              ),
              contentPadding: EdgeInsets.all(12.r),
              prefixIcon: SvgPicture.asset(
                prefixIconPath,
                fit: BoxFit.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(),
              ),
              hintText: hintText,
            ),
          ),
        ],
      ),
    );
  }
}
