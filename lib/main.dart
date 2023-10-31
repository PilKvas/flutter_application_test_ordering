import 'package:flutter/material.dart';
import 'package:flutter_application_test_ordering/features/oredering/presentation/provider/provider.dart';
import 'package:flutter_application_test_ordering/ordering_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DateProvider>(
          create: (_) => DateProvider(),
        ),
        ChangeNotifierProvider<AddAdressLine>(
          create: (_) => AddAdressLine(),
        ),
        ChangeNotifierProvider<FormValidation>(
          create: (_) => FormValidation(),
        ),
        ChangeNotifierProvider<TabSwitch>(
          create: (_) => TabSwitch(),
        ),
        ChangeNotifierProvider<RecipionistAction>(
          create: (_) => RecipionistAction(),
        ),
        ChangeNotifierProvider<SenderAction>(
          create: (_) => SenderAction(),
        ),
        ChangeNotifierProvider<RecipientControllerManager>(
          create: (_) => RecipientControllerManager(),
        ),
        ChangeNotifierProvider<SenderControllerManager>(
          create: (_) => SenderControllerManager(),
        ),
      ],
      child: const OrderingApp(),
    ),
  );
}
