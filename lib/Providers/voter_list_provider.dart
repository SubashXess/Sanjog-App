import 'package:flutter/cupertino.dart';

class VoterListProvider with ChangeNotifier {

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasData = false;
  bool get hasData => _hasData;

  bool _searchResultFound = false;
  bool get searchResultFound => _searchResultFound;

  void onLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void getData(bool value) {
    _hasData = value;
    notifyListeners();
  }

  void onSearchResult(bool value) {
    _searchResultFound = value;
    notifyListeners();
  }
}
