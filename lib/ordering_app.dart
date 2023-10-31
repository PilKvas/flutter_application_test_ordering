import 'package:flutter/material.dart';
import 'package:flutter_application_test_ordering/features/oredering/presentation/view/ordering_screen.dart';
import 'package:flutter_application_test_ordering/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderingApp extends StatelessWidget {
  const OrderingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 532),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ligthTheme,
          themeMode: ThemeMode.light,
          home: child,
        );
      },
      child: const OrderingScreen(),
    );
  }
}
