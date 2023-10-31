import 'package:flutter/material.dart';

class FormValidation extends ChangeNotifier {
  final GlobalKey<FormState> _recipionistsFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _senderFormKey = GlobalKey<FormState>();

  GlobalKey<FormState> get senderFormKey => _senderFormKey;

  GlobalKey<FormState> get recipionistsFormKey => _recipionistsFormKey;

  String? validateNameField(String? value) {
    final RegExp regex = RegExp(r'^[^\d]+$');
    if (!regex.hasMatch(value!)) {
      return 'Используйте только симовлы';
    }
    return null;
  }

  String? validateEmail(String? value) {
    final RegExp regex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!regex.hasMatch(value!)) {
      return 'email@post.xy';
    }
    return null;
  }

  String? validateNumber(String? value) {
    final RegExp regex = RegExp(r'^\d+$');
    if (!regex.hasMatch(value!)) {
      return 'Используйте только цифры';
    }
    return null;
  }

  String? validateCountry(String? value) {
    final RegExp regex = RegExp(r'^[a-zA-Z ]+$');
    if (!regex.hasMatch(value!)) {
      return 'Используйте только символы';
    }
    return null;
  }

  String? validateCity(String? value) {
    final RegExp regex = RegExp(r'^[a-zA-Z ]+$');
    if (!regex.hasMatch(value!)) {
      return 'Используйте только символы';
    }
    return null;
  }

  String? validateAdress(String? value) {
    final RegExp regex = RegExp(r'^[a-zA-Z0-9, ]+$');
    if (!regex.hasMatch(value!)) {
      return 'Используйте только символы (запятые разрешены)';
    }
    return null;
  }

  String? validatePostCode(String? value) {
    final RegExp regex = RegExp(r'^\d{5}$');
    if (!regex.hasMatch(value!)) {
      return 'Используйте число длинны 5';
    }
    return null;
  }
}
