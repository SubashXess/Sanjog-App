// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sonjagapp/Components/showsnackbar.dart';
import 'package:sonjagapp/Constants/constants.dart';
import 'package:sonjagapp/Models/user_data_model.dart';
import 'package:url_launcher/url_launcher.dart';

class APIServices {
  static Future<List<UserDataModel>?> getVoterList(context,
      {required String boothNo, required String name}) async {
    // int limit = 10;
    Client client = http.Client();
    Uri uri = Uri.parse('${APIs.VOTER_LIST_API}?boothNo=$boothNo');
    try {
      Response response = await client.get(uri);
      if (response.statusCode == 200) {
        String json = response.body;
        return getVoterListFromJson(json).where((element) {
          final nameLower = element.name!.toLowerCase();
          final searchLower = name.toLowerCase();
          return nameLower.contains(searchLower);
        }).toList();
      } else {
        return showSnackBar(context, 'Connection error');
      }
    } catch (e) {
      throw Exception('Unexpected error occured!');
    }
  }

  // static Future<List<UserDataModel>?> getSearchVoterList(context,
  //     {required String name}) async {
  //   // int limit = 10;
  //   Client client = http.Client();
  //   Uri uri = Uri.parse('${APIs.VOTER_SEARCH_BY_NAME_LIST_API}?name=$name');
  //   try {
  //     Response response = await client.get(uri);
  //     if (response.statusCode == 200) {
  //       String json = response.body;

  //       return getVoterListFromJson(json).where((items) {
  //         final nameLower = items.name!.toLowerCase();
  //         final searchLower = name.toLowerCase();
  //         // final relationLower = items.relationName!.toLowerCase();
  //         // final voterLower = items.voterNo!.toLowerCase();
  //         return nameLower.contains(
  //             searchLower); // add others using || relationLower || voterLower
  //       }).toList();
  //     } else {
  //       return showSnackBar(context, 'Connection error');
  //     }
  //   } catch (e) {
  //     throw Exception('Unexpected error occured!');
  //   }
  // }
}

class ApiClient {
  static void login(String username, String password) async {
    final http.Response response = await http
        .get(Uri.parse('${APIs.LOGIN_API}?u_name=$username&mobile=$password'));
    try {
      var data = jsonDecode(response.body.toString());

      if (response.statusCode == 200) {
        print(data['message']);
      } else {
        print(data['message']);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class SocialLink {
  static Future<void> openFacebook() async {
    String fbProtocolUrl;
    if (Platform.isIOS) {
      fbProtocolUrl = 'fb://profile/babusinghodisha';
    } else {
      fbProtocolUrl = 'fb://page/babusinghodisha';
      print('android');
    }

    String fallbackUrl = 'https://www.facebook.com/babusinghodisha';

    try {
      Uri fbBundleUri = Uri.parse(fbProtocolUrl);
      var canLaunchNatively = await canLaunchUrl(fbBundleUri);
      if (canLaunchNatively) {
        launchUrl(fbBundleUri);
        print('ok');
      } else {
        await launchUrl(Uri.parse(fallbackUrl),
            mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> openTwitter() async {
    String fbProtocolUrl;
    if (Platform.isIOS) {
      fbProtocolUrl = 'https://twitter.com/AprajitaSarangi';
    } else {
      fbProtocolUrl = 'https://twitter.com/AprajitaSarangi';
      print('android');
    }

    String fallbackUrl = 'https://twitter.com/AprajitaSarangi';

    try {
      Uri fbBundleUri = Uri.parse(fbProtocolUrl);
      var canLaunchNatively = await canLaunchUrl(fbBundleUri);
      if (canLaunchNatively) {
        launchUrl(fbBundleUri);
        print('ok');
      } else {
        await launchUrl(Uri.parse(fallbackUrl),
            mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> openInstagram() async {
    String fbProtocolUrl;
    if (Platform.isIOS) {
      fbProtocolUrl = 'instagram://user?username=aparajitasarangi';
    } else {
      fbProtocolUrl = 'instagram://user?username=aparajitasarangi';
      print('android');
    }

    String fallbackUrl = 'https://www.instagram.com/aparajitasarangi/';

    try {
      Uri fbBundleUri = Uri.parse(fbProtocolUrl);
      var canLaunchNatively = await canLaunchUrl(fbBundleUri);
      if (canLaunchNatively) {
        launchUrl(fbBundleUri);
        print('ok');
      } else {
        await launchUrl(Uri.parse(fallbackUrl),
            mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> openYoutube() async {
    String fbProtocolUrl;
    if (Platform.isIOS) {
      fbProtocolUrl = 'youtube://www.youtube.com/channel/bjp';
    } else {
      fbProtocolUrl = 'https://www.youtube.com/c/bjp';
      print('android');
    }

    String fallbackUrl = 'https://www.youtube.com/c/bjp';

    try {
      Uri fbBundleUri = Uri.parse(fbProtocolUrl);
      var canLaunchNatively = await canLaunchUrl(fbBundleUri);
      if (canLaunchNatively) {
        launchUrl(fbBundleUri);
        print('ok');
      } else {
        await launchUrl(Uri.parse(fallbackUrl),
            mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> openModi() async {
    String fbProtocolUrl;
    if (Platform.isIOS) {
      fbProtocolUrl = 'https://apps.apple.com/in/app/narendra-modi';
    } else {
      fbProtocolUrl =
          'https://play.google.com/store/apps/details?id=com.narendramodiapp';
      print('android');
    }

    String fallbackUrl = 'https://www.narendramodi.in/';

    try {
      Uri fbBundleUri = Uri.parse(fbProtocolUrl);
      var canLaunchNatively = await canLaunchUrl(fbBundleUri);
      if (canLaunchNatively) {
        launchUrl(fbBundleUri);
        print('ok');
      } else {
        await launchUrl(Uri.parse(fallbackUrl),
            mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
