import 'package:flutter/material.dart';
import 'package:flutter_application_test_ordering/features/oredering/presentation/widgets/sender_details/sender_details.dart';
import 'package:flutter_application_test_ordering/features/oredering/presentation/widgets/recipient_details/recipient_details.dart';
import 'package:flutter_application_test_ordering/features/oredering/presentation/widgets/next_step_button.dart';
import 'package:flutter_application_test_ordering/features/oredering/presentation/widgets/start_date.dart';
import 'package:flutter_application_test_ordering/theme/light_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OrderingScreen extends StatelessWidget {
  const OrderingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/images/arrow.svg'),
        ),
        elevation: 0,
        title: const Text('Ordering'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: const Color(0xFFE7ECF0),
            height: 0.5.h,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                  ),
                  child: Text(
                    'Step 1',
                    style: Theme.of(context).textTheme.stepTitle,
                  ),
                ),
                const StartDate(),
                SizedBox(
                  height: 16.h,
                ),
                const SenderDetails(),
                SizedBox(
                  height: 16.h,
                ),
                const RecipientDetail(),
                const NextStepButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
