import 'package:flutter/material.dart';
import 'package:flutter_application_test_ordering/features/oredering/domain/model.dart';
import 'package:flutter_application_test_ordering/features/oredering/presentation/provider/provider.dart';
import 'package:flutter_application_test_ordering/theme/theme.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ListOfRecipionists extends StatefulWidget {
  const ListOfRecipionists({
    super.key,
  });

  @override
  State<ListOfRecipionists> createState() => _ListOfRecipionistsState();
}

class _ListOfRecipionistsState extends State<ListOfRecipionists> {
  @override
  void initState() {
    super.initState();

    context.read<RecipionistAction>().filteredRecipionists =
        context.read<RecipionistAction>().recipionists;
  }

  @override
  Widget build(BuildContext context) {
    List<UserModel> initialArray =
        context.watch<RecipionistAction>().recipionists;
    return SizedBox(
      height: 100.h,
      child: initialArray.isNotEmpty
          ? Column(
              children: [
                TextField(
                  controller:
                      context.read<RecipientControllerManager>().searchBar,
                  onChanged: (query) {
                    context.read<RecipionistAction>().searchRecipionist(query);
                  },
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors
                              .buttonActiveBackgroundColor), // Цвет подсветки при активации
                    ),
                    contentPadding: EdgeInsets.all(12.r),
                    prefixIcon: SvgPicture.asset(
                      'assets/images/search.svg',
                      fit: BoxFit.none,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(),
                    ),
                    hintText: 'Поиск',
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Expanded(
                  child: ListView.separated(
                      itemCount: context
                          .watch<RecipionistAction>()
                          .filteredRecipionists
                          .length,
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemBuilder: (context, int index) {
                        final user = context
                            .watch<RecipionistAction>()
                            .filteredRecipionists[index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: AppColors.cardColor,
                          ),
                          child: ListTile(
                            title: Text(user.name),
                            subtitle: Text(
                              '${user.country}, ${user.city}, ${user.adress}, ${user.postcode}',
                            ),
                            trailing:
                                SvgPicture.asset('assets/images/edit.svg'),
                          ),
                        );
                      }),
                ),
              ],
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animation/empty.json'),
                  const Text("No data yet"),
                ],
              ),
            ),
    );
  }
}
