import 'package:flutter/foundation.dart';

class EditButtonProvider with ChangeNotifier {
  bool _isEdit = false;
  bool get isEdit => _isEdit;

  void onTapEdit(value) {
    _isEdit = value;
    notifyListeners();
  }
}
