import 'package:flutter/material.dart';
import 'package:flutter_application_test_ordering/features/oredering/domain/model.dart';

class TabSwitch extends ChangeNotifier {
  RecipientTabState _chosenRecipientTab = RecipientTabState.add;
  SenderTabState _chosenSenderTab = SenderTabState.add;

  SenderTabState get chosenSenderTab => _chosenSenderTab;

  RecipientTabState get chosenRecipientTab => _chosenRecipientTab;

  void addAdressSenderTab() {
    if (_chosenSenderTab != SenderTabState.add) {
      _chosenSenderTab = SenderTabState.add;
    } else {
      return;
    }
    notifyListeners();
  }

  void selectAdressSenderTab() {
    if (_chosenSenderTab != SenderTabState.select) {
      _chosenSenderTab = SenderTabState.select;
    } else {
      return;
    }
    notifyListeners();
  }

  void addAdressRecipientTab() {
    if (_chosenRecipientTab != RecipientTabState.add) {
      _chosenRecipientTab = RecipientTabState.add;
    } else {
      return;
    }
    notifyListeners();
  }

  void selectAdressRecipientTab() {
    if (_chosenRecipientTab != RecipientTabState.select) {
      _chosenRecipientTab = RecipientTabState.select;
    } else {
      return;
    }
    notifyListeners();
  }
}
