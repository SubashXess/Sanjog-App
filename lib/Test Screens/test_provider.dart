// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:sonjagapp/Error%20Screens/no_internet_connection.dart';
import 'package:sonjagapp/Models/user_data_model.dart';

import 'test_service.dart';

class TestProvider with ChangeNotifier {
  List<UserDataModel> _data = [];
  List<UserDataModel> get data => _data;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasNodata = false;
  bool get hasNodata => _hasNodata;

  bool _isOnline = false;
  bool get isOnline => _isOnline;

  getVoterData(context, String booth) async {
    _isLoading = true;
    _data = (await TestService.getData(context, booth))!.where((boothNo) {
      final String boothNoLower = boothNo.boothNo!.toLowerCase().toString();
      print('here');
      return boothNoLower.contains(booth);
    }).toList();
    _isLoading = false;
    connectionAvailable();
    hasNoDataFound();
    notifyListeners();
  }

  void hasNoDataFound() {
    if (data.isEmpty) {
      _hasNodata = true;
    } else {
      _hasNodata = false;
    }
  }

  void connectionAvailable() {
    if (_isOnline) {
      _isOnline = false;
    } else {
      _isOnline = true;
    }
  }
}
