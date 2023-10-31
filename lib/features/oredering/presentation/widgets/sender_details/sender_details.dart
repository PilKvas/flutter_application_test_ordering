import 'package:flutter/material.dart';
import 'package:flutter_application_test_ordering/features/oredering/domain/model.dart';
import 'package:flutter_application_test_ordering/features/oredering/presentation/provider/provider.dart';
import 'package:flutter_application_test_ordering/features/oredering/presentation/widgets/widgets.dart';
import 'package:flutter_application_test_ordering/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SenderDetails extends StatelessWidget {
  const SenderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    SenderTabState chosenTab = context.watch<TabSwitch>().chosenSenderTab;
    return Container(
      color: AppColors.elementBackgound,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sender details",
            style: Theme.of(context).textTheme.moduleTitle,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () =>
                      context.read<TabSwitch>().addAdressSenderTab(),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.r), // <-- Radius
                    ),
                    backgroundColor: chosenTab == SenderTabState.add
                        ? AppColors.buttonActiveBackgroundColor
                        : AppColors.buttonDisabledBackgroundColor,
                  ),
                  child: Text(
                    "Add adress",
                    style: chosenTab == SenderTabState.add
                        ? Theme.of(context).textTheme.activeButtonText
                        : Theme.of(context).textTheme.activeButtonText.copyWith(
                              color: const Color(0xFF919DAB),
                            ),
                  ),
                ),
              ),
              SizedBox(
                width: 7.w,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.r), // <-- Radius
                    ),
                    backgroundColor: chosenTab == SenderTabState.select
                        ? AppColors.buttonActiveBackgroundColor
                        : AppColors.buttonDisabledBackgroundColor,
                  ),
                  onPressed: () =>
                      context.read<TabSwitch>().selectAdressSenderTab(),
                  child: Text(
                    "Select adress",
                    style: chosenTab == SenderTabState.select
                        ? Theme.of(context).textTheme.activeButtonText
                        : Theme.of(context)
                            .textTheme
                            .activeButtonText
                            .copyWith(color: const Color(0xFF919DAB)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          chosenTab == SenderTabState.add
              ? TextFieldColumn(
                  user: 'sender',
                  controllersErase: () => context
                      .read<SenderControllerManager>()
                      .controllersErase(),
                  formKey: context.read<FormValidation>().senderFormKey,
                  action: () => context.read<SenderAction>().addSender(
                        UserModel(
                          name: context
                              .read<SenderControllerManager>()
                              .textFieldName
                              .text,
                          email: context
                              .read<SenderControllerManager>()
                              .textFieldEmail
                              .text,
                          number: context
                              .read<SenderControllerManager>()
                              .textFieldNumber
                              .text,
                          country: context
                              .read<SenderControllerManager>()
                              .textFieldCountry
                              .text,
                          city: context
                              .read<SenderControllerManager>()
                              .textFieldCity
                              .text,
                          adress: context
                              .read<SenderControllerManager>()
                              .textFieldAdress
                              .text,
                          postcode: context
                              .read<SenderControllerManager>()
                              .textFieldPost
                              .text,
                        ),
                      ),
                  controllerManager: context.read<SenderControllerManager>(),
                )
              : const ListOfSenders()
        ],
      ),
    );
  }
}
