import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sonjagapp/Error%20Screens/no_data_found.dart';
import 'package:sonjagapp/Screens/login_screen.dart';
import 'package:sonjagapp/Screens/samiti_screen.dart';
import 'package:sonjagapp/Screens/search_by_voter_id_screen.dart';
import 'package:sonjagapp/Screens/voter_list_screen.dart';
import 'package:sonjagapp/Test%20Screens/test_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final isLoggedIn = preferences.getBool('login') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.isLoggedIn});

  final bool? isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanjog App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      // home: isLoggedIn! ? const SamitiScreen() : const LoginScreen(),
      // home: SamitiScreen(),
      home: SamitiScreen(),
      // home: const AddDetailsScreen(
      //   voterId: 'YXV0934471',
      //   acNo: '111',
      // ),
    );
  }

  // Future<String> checkLogin() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String? value = preferences.getString('login');
  //   if (value!.isNotEmpty) {
  //     return value;
  //     // await Navigator.push(context,
  //     //     MaterialPageRoute(builder: (context) => const SamitiScreen()));
  //   } else {
  //     return value;
  //     // Navigator.push(context,
  //     //     MaterialPageRoute(builder: (context) => const LoginScreen()));
  //   }
  //   // return value;
  // }
}
