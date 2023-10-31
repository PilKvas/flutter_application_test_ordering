import 'package:flutter/material.dart';
import 'package:flutter_application_test_ordering/features/oredering/domain/model.dart';
import 'package:flutter_application_test_ordering/features/oredering/presentation/provider/provider.dart';
import 'package:flutter_application_test_ordering/features/oredering/presentation/widgets/widgets.dart';
import 'package:flutter_application_test_ordering/theme/theme.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RecipientDetail extends StatelessWidget {
  const RecipientDetail({super.key});

  @override
  Widget build(BuildContext context) {
    RecipientTabState chosenRecipientTab =
        context.watch<TabSwitch>().chosenRecipientTab;
    return Container(
      color: AppColors.elementBackgound,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recipient details",
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
                      context.read<TabSwitch>().addAdressRecipientTab(),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.r),
                    ),
                    backgroundColor: chosenRecipientTab == RecipientTabState.add
                        ? AppColors.buttonActiveBackgroundColor
                        : AppColors.buttonDisabledBackgroundColor,
                  ),
                  child: Text(
                    "Add adress",
                    style: chosenRecipientTab == RecipientTabState.add
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
                      borderRadius: BorderRadius.circular(36.r),
                    ),
                    backgroundColor:
                        chosenRecipientTab == RecipientTabState.select
                            ? AppColors.buttonActiveBackgroundColor
                            : AppColors.buttonDisabledBackgroundColor,
                  ),
                  onPressed: () =>
                      context.read<TabSwitch>().selectAdressRecipientTab(),
                  child: Text(
                    "Select adress",
                    style: chosenRecipientTab == RecipientTabState.select
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
          chosenRecipientTab == RecipientTabState.add
              ? TextFieldColumn(
                  user: 'recipient',
                  controllersErase: () => context
                      .read<RecipientControllerManager>()
                      .controllersErase(),
                  formKey: context.read<FormValidation>().recipionistsFormKey,
                  action: () =>
                      context.read<RecipionistAction>().addRecipienist(
                            UserModel(
                              name: context
                                  .read<RecipientControllerManager>()
                                  .textFieldName
                                  .text,
                              email: context
                                  .read<RecipientControllerManager>()
                                  .textFieldEmail
                                  .text,
                              number: context
                                  .read<RecipientControllerManager>()
                                  .textFieldNumber
                                  .text,
                              country: context
                                  .read<RecipientControllerManager>()
                                  .textFieldCountry
                                  .text,
                              city: context
                                  .read<RecipientControllerManager>()
                                  .textFieldCity
                                  .text,
                              adress: context
                                  .read<RecipientControllerManager>()
                                  .textFieldAdress
                                  .text,
                              postcode: context
                                  .read<RecipientControllerManager>()
                                  .textFieldPost
                                  .text,
                            ),
                          ),
                  controllerManager:
                      context.watch<RecipientControllerManager>(),
                )
              : const ListOfRecipionists()
        ],
      ),
    );
  }
}
