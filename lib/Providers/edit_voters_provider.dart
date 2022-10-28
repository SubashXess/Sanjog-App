import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sonjagapp/Models/user_data_model.dart';
import 'package:sonjagapp/Services/service.dart';

class EditVotersProvider with ChangeNotifier {
  List<UserDataModel> _data = [];
  List<UserDataModel> get data => _data;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasNodata = false;
  bool get hasNodata => _hasNodata;

  void getEditVoterDetails(context, String id) async {
    _isLoading = true;
    _data = (await APIServices.getVoterDetails(context))!.where((ids) {
      final String lowerId = ids.id!.trim().toLowerCase().toString();
      return lowerId.contains(id);
    }).toList();
    _isLoading = false;
    hasNoDataFound();
    notifyListeners();
  }

  void hasNoDataFound() {
    if (data.isEmpty) {
      _hasNodata = true;
    } else {
      _hasNodata = false;
    }
    notifyListeners();
  }
}
