import 'package:flutter/material.dart';

class RecipientControllerManager extends ChangeNotifier {
  final TextEditingController searchBar = TextEditingController();
  final TextEditingController textFieldAdress = TextEditingController();
  final TextEditingController textFieldCity = TextEditingController();
  final TextEditingController textFieldCountry = TextEditingController();
  final TextEditingController textFieldEmail = TextEditingController();
  final TextEditingController textFieldName = TextEditingController();
  final TextEditingController textFieldNumber = TextEditingController();
  final TextEditingController textFieldPost = TextEditingController();
  final TextEditingController textFieldSecondAdress = TextEditingController();

  @override
  void dispose() {
    textFieldName.dispose();
    textFieldEmail.dispose();
    textFieldNumber.dispose();
    textFieldCountry.dispose();
    textFieldCity.dispose();
    textFieldAdress.dispose();
    textFieldPost.dispose();
    searchBar.dispose();
    super.dispose();
  }

  void controllersErase() {
    textFieldAdress.clear();
    textFieldCity.clear();
    textFieldCountry.clear();
    textFieldEmail.clear();
    textFieldName.clear();
    textFieldNumber.clear();
    textFieldPost.clear();
    textFieldSecondAdress.clear();
  }
}
