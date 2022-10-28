// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sonjagapp/Constants/constants.dart';
import 'package:sonjagapp/Models/user_data_model.dart';

class TestService {
  static Future<List<UserDataModel>?> getData(context, booth) async {
    // int limit = 10;
    Client client = http.Client();
    Uri uri = Uri.parse(APIs.VOTER_LIST_API);
    try {
      Response response = await client.get(uri);
      if (response.statusCode == 200) {
        String json = response.body;
        return getVoterListFromJson(json);
      } else {
        print(response.statusCode);
        return Future.error('Connection Error');
      }
    } catch (e) {
      return Future.error('Unexpected Error $e');
    }
  }
}
