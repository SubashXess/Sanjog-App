// import 'package:flutter/foundation.dart';
// import 'package:sonjagapp/Models/user_data_model.dart';
// import 'package:sonjagapp/Test%20Screens/test_service.dart';

// class VoterListProvider with ChangeNotifier {
//   List<UserDataModel> _items = [];
//   List<UserDataModel> get items => _items;

//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   bool _hasNodata = false;
//   bool get hasNodata => _hasNodata;

//   void getVoterData(context, {String? booth, String? name}) async {
//     _isLoading = true;
//     _items = (await TestService.getData(context, booth))!;
//     _isLoading = false;
//     _hasNoDataFound();
//     notifyListeners();
//   }

//   void _hasNoDataFound() {
//     if (_items.isNotEmpty) {
//       _hasNodata = false;
//     } else {
//       _hasNodata = true;
//     }
//   }
// }
