// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sonjagapp/Components/showsnackbar.dart';
import 'package:sonjagapp/Constants/constants.dart';
import 'package:sonjagapp/Models/user_data_model.dart';
import 'package:sonjagapp/Screens/login_screen.dart';
import 'package:sonjagapp/Screens/samiti_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class APIServices {
  static Future<List<UserDataModel>?> getVoterList(
    context, {
    required String boothNo,
    String? name,
  }) async {
    // int limit = 10;
    Client client = http.Client();
    Uri uri = Uri.parse(APIs.VOTER_LIST_API);
    try {
      Response response = await client.get(uri);
      if (response.statusCode == 200) {
        String json = response.body;
        return getVoterListFromJson(json).where((items) {
          final String nameLower = items.fname!.toLowerCase() +
              items.mname!.toLowerCase() +
              items.lname!.toLowerCase();
          final String boothNoLower = items.boothNo!.toLowerCase().toString();
          final String searchLower = name!.toLowerCase().toString();
          return nameLower.contains(searchLower) &&
              boothNoLower.contains(boothNo);
        }).toList();
      } else {
        print(response.statusCode);
        return Future.error('Connection Error');
      }
    } catch (e) {
      return Future.error('Unexpected Error $e');
    }
  }

  static Future<List<UserDataModel>?> getVoterIdSearchResult(context,
      {required String voterId}) async {
    Client client = http.Client();
    Uri uri = Uri.parse(APIs.VOTER_LIST_API);
    try {
      Response response = await client.get(uri);
      if (response.statusCode == 200) {
        String json = response.body;
        return getVoterListFromJson(json).where((items) {
          final String voterIdLower =
              items.voterNo!.trim().toLowerCase().toString();
          final String searchVoterId = voterId.trim().toLowerCase().toString();
          return voterIdLower.contains(searchVoterId);
        }).toList();
      } else {
        return Future.error('Connection Error');
      }
    } catch (e) {
      return Future.error('Unexpected Error $e');
    }
  }

  static Future<List<UserDataModel>>? getPageSamitiSearchResult(context,
      {required String boothNo}) async {
    Client client = http.Client();
    Uri uri = Uri.parse(APIs.VOTER_LIST_API);
    try {
      Response response = await client.get(uri);
      if (response.statusCode == 200) {
        String json = response.body;
        return getVoterListFromJson(json).where((items) {
          final String boothNoLower =
              items.boothNo!.trim().toLowerCase().toString();
          final String searchBoothNo = boothNo.trim().toLowerCase().toString();
          return boothNoLower.contains(searchBoothNo);
        }).toList();
      } else {
        return Future.error('Connection Error');
      }
    } catch (e) {
      return Future.error(showSnackBar(context, 'Unexpected Error $e'));
    }
  }

  static Future<List<UserDataModel>>? getVoterDetails(context) async {
    Client client = http.Client();
    Uri uri = Uri.parse(APIs.VOTER_LIST_API);
    try {
      Response response = await client.get(uri);
      if (response.statusCode == 200) {
        String json = response.body;
        print(json);
        return getVoterListFromJson(json);
      } else {
        return Future.error('Connection Error');
      }
    } catch (e) {
      return Future.error('Unexpected Error $e');
    }
  }

  static Future<String> updateUserData(
    context, {
    String? address,
    String? id,
    String? loginUserId,
    String? photo,
    String? position,
    String? category,
    String? mobile,
    String? wpNumber,
    String? dob,
    String? dom,
    String? bloodGroup,
    String? postBJP,
    String? socialOrg,
  }) async {
    Client client = http.Client();
    Uri uri = Uri.parse(APIs.USER_DATA_UPDATE);
    try {
      Response response = await client.post(uri, body: <String, String>{
        'id': id.toString(), // voter user for each
        'user_id': loginUserId
            .toString(), // assembly user id who is update this / login user
        'photo': photo.toString(),
        'position': position.toString(),
        'category': category.toString(),
        'mobileNo': mobile.toString(),
        'whatsappNo': wpNumber.toString(),
        'address': address.toString(),
        'dob': dob.toString(),
        'dom': dom.toString(),
        'blood_group': bloodGroup.toString(),
        'postBJP': postBJP.toString(),
        'soc_org': socialOrg.toString(),
      });
      // print(id);
      // print(address);
      // print(position);
      // print(category);
      // print(mobile);
      // print(wpNumber);
      // print(dob);
      // print(dom);
      // print(bloodGroup);
      // print(postBJP);
      // print(socialOrg);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(jsonResponse);
        return jsonResponse;
      } else {
        return Future.error('Connection Error');
      }
    } catch (e) {
      return Future.error('Unexpected Error $e');
    }
  }
}

class ApiClient {
  static Future<void> login(context, username, password) async {
    final http.Response response = await http.get(
        Uri.parse('${APIs.LOGIN_API}?username=$username&password=$password'));

    var data = jsonDecode(response.body.toString());
    try {
      if (response.statusCode == 200) {
        if (data['status'] == '1') {
          print('Response ${response.body}');
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setBool('login', true);
          if (await preferences.setBool('login', true)) {
            preferences.setString('name', data['name']);
            preferences.setString('mobile', data['mobile']);
            preferences.setString('id', data['id']);
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const SamitiScreen()),
              (route) => false,
            );
          } else {
            return;
          }
        } else {
          showSnackBar(context, 'Username and password is incorrect');
        }
      } else {
        showSnackBar(context, 'Connection Error');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> logout(context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
    preferences.setBool('login', false);
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
