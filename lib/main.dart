import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sonjagapp/Error%20Screens/no_data_found.dart';
import 'package:sonjagapp/Error%20Screens/no_internet_connection.dart';
import 'package:sonjagapp/Providers/add_to_family_members_provider.dart';
import 'package:sonjagapp/Providers/connection_provider.dart';
import 'package:sonjagapp/Providers/edit_voters_provider.dart';
import 'package:sonjagapp/Providers/voter_list_provider.dart';
import 'package:sonjagapp/Screens/add_family_members_list_screen.dart';
import 'package:sonjagapp/Screens/search_family_members.dart';
import 'package:sonjagapp/Screens/login_screen.dart';
import 'package:sonjagapp/Screens/samiti_screen.dart';
import 'package:sonjagapp/Screens/search_by_voter_id_screen.dart';
import 'package:sonjagapp/Screens/voter_list_screen.dart';
import 'package:sonjagapp/Test%20Screens/test_provider.dart';
import 'package:sonjagapp/Test%20Screens/test_screen.dart';
import 'package:sonjagapp/Test%20Screens/test_screen_2.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ConnectivityProvider()),
        ChangeNotifierProvider(create: (context) => EditVotersProvider()),
        ChangeNotifierProvider(create: (context) => AddToFamilyProvider()),
      ],
      builder: (context, child) => MaterialApp(
        title: 'Sanjog App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red),
        home: isLoggedIn! ? const SamitiScreen() : const LoginScreen(),
        // home: TestDateFormatted(),
        // home: const SamitiScreen(),
        // home: const BS(),
      ),
    );
  }
}
