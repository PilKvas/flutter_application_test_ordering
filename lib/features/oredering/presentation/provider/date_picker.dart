import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateProvider extends ChangeNotifier {
  DateProvider() {
    _dateController = TextEditingController();
    _selectedDate = DateTime.now();
  }

  late TextEditingController _dateController;
  late DateTime _selectedDate;

  TextEditingController get dateController => _dateController;

  String get formattedDate => DateFormat.yMMMd('en_US').format(_selectedDate);

  void selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      _selectedDate = pickedDate;
      _dateController.text = formattedDate;
      notifyListeners();
    }
  }
}
