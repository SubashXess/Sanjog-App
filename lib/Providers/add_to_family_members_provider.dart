import 'package:flutter/foundation.dart';

class AddToFamilyProvider with ChangeNotifier {
  final List<int> _selectedMember = [];
  List<int> get selectedMember => _selectedMember;

  void addMembers(int value) {
    _selectedMember.add(value);
    notifyListeners();
  }

  void removeMembers(int value) {
    _selectedMember.remove(value);
    print(value);
    notifyListeners();
  }
}
