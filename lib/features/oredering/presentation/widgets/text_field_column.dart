import 'package:flutter/material.dart';
import 'package:flutter_application_test_ordering/features/oredering/presentation/provider/add_adress_line.dart';
import 'package:flutter_application_test_ordering/features/oredering/presentation/provider/form_validation.dart';
import 'package:flutter_application_test_ordering/features/oredering/presentation/widgets/custom_textfield.dart';
import 'package:flutter_application_test_ordering/theme/app_colors.dart';
import 'package:flutter_application_test_ordering/theme/light_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TextFieldColumn extends StatelessWidget {
  const TextFieldColumn({
    super.key,
    required this.controllerManager,
    required this.action,
    this.validateState,
    required this.formKey,
    required this.controllersErase,
    required this.user,
  });

  final void Function() action;
  final dynamic controllerManager;
  final void Function() controllersErase;
  final GlobalKey<FormState> formKey;
  final String user;
  final bool? validateState;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
              validator: (value) =>
                  context.read<FormValidation>().validateNameField(value),
              keyboardType: TextInputType.name,
              controller: controllerManager.textFieldName,
              textFieldTitle: "Full name*",
              hintText: "Enter your name",
              prefixIconPath: "assets/images/person.svg"),
          CustomTextField(
              validator: (value) =>
                  context.read<FormValidation>().validateEmail(value),
              keyboardType: TextInputType.emailAddress,
              controller: controllerManager.textFieldEmail,
              textFieldTitle: "Email*",
              hintText: "egor_zu@email.com",
              prefixIconPath: "assets/images/mail.svg"),
          CustomTextField(
              validator: (value) =>
                  context.read<FormValidation>().validateNumber(value),
              keyboardType: TextInputType.number,
              controller: controllerManager.textFieldNumber,
              textFieldTitle: "Phone number*",
              hintText: "Enter your number",
              prefixIconPath: "assets/images/phone.svg"),
          SizedBox(
            height: 10.h,
          ),
          const Divider(),
          CustomTextField(
              validator: (value) =>
                  context.read<FormValidation>().validateCountry(value),
              keyboardType: TextInputType.name,
              controller: controllerManager.textFieldCountry,
              textFieldTitle: "Country*",
              hintText: "Enter your country",
              prefixIconPath: "assets/images/location.svg"),
          CustomTextField(
              validator: (value) =>
                  context.read<FormValidation>().validateCity(value),
              keyboardType: TextInputType.name,
              controller: controllerManager.textFieldCity,
              textFieldTitle: "City*",
              hintText: "Enter your city",
              prefixIconPath: "assets/images/city.svg"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                  validator: (value) =>
                      context.read<FormValidation>().validateAdress(value),
                  keyboardType: TextInputType.streetAddress,
                  controller: controllerManager.textFieldAdress,
                  textFieldTitle: "Adress line 1*",
                  hintText: "Enter your adress",
                  prefixIconPath: "assets/images/adress.svg"),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: GestureDetector(
                  onTap: () {
                    context.read<AddAdressLine>().addAdressLine();
                  },
                  child: Container(
                    child: !context.watch<AddAdressLine>().visble
                        ? Text(
                            'Add adress line +',
                            style: Theme.of(context).textTheme.addAdress,
                          )
                        : null,
                  ),
                ),
              ),
              Container(
                child: context.watch<AddAdressLine>().visble
                    ? CustomTextField(
                        validator: (value) => context
                            .read<FormValidation>()
                            .validateAdress(value),
                        keyboardType: TextInputType.streetAddress,
                        controller: controllerManager.textFieldSecondAdress,
                        textFieldTitle: "Adress line 2*",
                        hintText: "Enter second adress",
                        prefixIconPath: "assets/images/adress.svg")
                    : null,
              ),
            ],
          ),
          CustomTextField(
              validator: (value) =>
                  context.read<FormValidation>().validatePostCode(value),
              keyboardType: TextInputType.number,
              controller: controllerManager.textFieldPost,
              textFieldTitle: "Postcode*",
              hintText: "Enter your postcode",
              prefixIconPath: "assets/images/post_code.svg"),
          SizedBox(
            height: 10.h,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.r),
                ),
                backgroundColor: AppColors.buttonActiveBackgroundColor),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  width: 100.w,
                  backgroundColor: AppColors.buttonActiveBackgroundColor,
                  content: const Center(
                    child: Text(
                      "Added",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ));
                action();
                controllersErase();
              }
            },
            child: Text("Add $user"),
          ),
        ],
      ),
    );
  }
}
