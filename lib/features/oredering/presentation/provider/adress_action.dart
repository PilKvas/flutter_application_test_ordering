import 'package:flutter/material.dart';
import 'package:flutter_application_test_ordering/features/oredering/domain/model.dart';

class SenderAction extends ChangeNotifier {
  List<UserModel> filteredSenders = [];

  final List<UserModel> _senders = [
    UserModel(
        name: 'Denilev Egor',
        email: 'egor_zu@email.com',
        number: '+375726014690',
        country: 'Belarus',
        city: 'Minsk',
        adress: 'Derzhinskogo 3b',
        postcode: '220069'),
  ];

  List<UserModel> get senders => _senders;

  void searchSender(String query) {
    if (query.isNotEmpty) {
      filteredSenders = _senders.where((UserModel movie) {
        return movie.name.toUpperCase().contains(query.toUpperCase());
      }).toList();
    } else {
      filteredSenders = _senders;
    }
    notifyListeners();
  }

  void addSender(UserModel sender) {
    _senders.add(sender);
    notifyListeners();
  }
}

class RecipionistAction extends ChangeNotifier {
  List<UserModel> filteredRecipionists = [];

  final List<UserModel> _recipionists = [];

  List<UserModel> get recipionists => _recipionists;

  void searchRecipionist(String query) {
    if (query.isNotEmpty) {
      filteredRecipionists = _recipionists.where((UserModel user) {
        return user.name.toUpperCase().contains(query.toUpperCase());
      }).toList();
    } else {
      filteredRecipionists = _recipionists;
    }
    notifyListeners();
  }

  void addRecipienist(UserModel sender) {
    _recipionists.add(sender);
    notifyListeners();
  }
}
