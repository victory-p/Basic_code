// state.dart
import 'package:flutter/material.dart';

class SelectedItems with ChangeNotifier {
  List<String> _checkedItems = [];

  List<String> get checkedItems => _checkedItems;

  void addCheckedItem(String item) {
    if (!_checkedItems.contains(item)) {
      _checkedItems.add(item);
      notifyListeners();
    }
  }

  void removeCheckedItem(String item) {
    _checkedItems.remove(item);
    notifyListeners();
  }

  bool isItemChecked(String item) {
    return _checkedItems.contains(item);
  }
}
