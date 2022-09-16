// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sonjagapp/Components/gradients.dart';
import 'package:sonjagapp/Components/showsnackbar.dart';
import 'package:sonjagapp/Screens/entrythroughvoterlist_screen.dart';
import 'package:sonjagapp/Constants/constants.dart';
import 'package:sonjagapp/Screens/samiti_screen.dart';
import 'package:sonjagapp/Services/service.dart';
import 'package:http/http.dart' as http;
import '../Widgets/button_widget.dart';
import '../Widgets/dropdown_widget.dart';
import '../Widgets/textformfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form validate global state
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _userLevelController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = true;
  bool _isLoading = false;

  // Initial Selected Value
  String defaultValue = '';

  @override
  void initState() {
    super.initState();
    _userNameController.addListener(onListen);
    _passwordController.addListener(onListen);
  }

  @override
  void dispose() {
    super.dispose();
    // _userLevelController.dispose();
    _userNameController.removeListener(onListen);
    _userNameController.dispose();
    _passwordController.removeListener(onListen);
    _passwordController.dispose();
  }

  void onListen() {
    setState(() {});
  }

  // List of items in our dropdown menu
  List<String> items = [
    'Loksabha',
    'Assembly',
    'Block',
    'Mandal',
    'GB/ULB Unit',
    'Booth',
    'Guest',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          height: size.height,
          decoration: BoxDecoration(
            gradient: gradientColor2(
                color2: Constants.kLightThemeColor,
                color1: const Color.fromARGB(255, 240, 100, 13)),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.08),
                    Text(
                      'Sanjog Ekamra'.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: Constants.fontUltraLarge,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.045),
                    Container(
                      width: 145.0,
                      height: 145.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.kLightThemeColor,
                        border: Border.all(
                            width: 2.5, color: Constants.kLightThemeColor),
                        image: const DecorationImage(
                          image: AssetImage('assets/pic-1.jpeg'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Colors.black26,
                            spreadRadius: 1.0,
                            offset: Offset(0.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.045),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: size.width,
                              child: DropdownButtonFormField<String>(
                                value: defaultValue.isNotEmpty
                                    ? defaultValue
                                    : null,
                                hint: const Text(
                                  'User level',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: Constants.fontRegular,
                                      fontWeight: FontWeight.w500),
                                ),
                                isExpanded: true,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                isDense: true,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  errorMaxLines: 2,
                                  filled: true,
                                  fillColor: Constants.kLightThemeColor,
                                  prefixIcon: Container(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SvgPicture.asset(
                                      'assets/svg/bjp-india.svg',
                                      // color: Constants.kPrimaryThemeColor,
                                      height: 12,
                                      width: 12,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  errorStyle: const TextStyle(
                                      color: Colors.red,
                                      fontSize: Constants.fontSmall,
                                      fontWeight: FontWeight.normal),
                                ),
                                selectedItemBuilder: (context) => items
                                    .map((e) => Text(
                                          e,
                                          style: const TextStyle(
                                              fontSize: Constants.fontRegular,
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal),
                                        ))
                                    .toList(),
                                items: items
                                    .map(
                                      (e) => DropdownMenuItem<String>(
                                        alignment: Alignment.centerLeft,
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Constants.kPrimaryThemeColor,
                                  size: 26.0,
                                ),
                                validator: (String? value) {
                                  if (value == null) {
                                    return 'Required user level';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  defaultValue = value!;
                                  print(defaultValue);
                                },
                              ),
                            ),
                            SizedBox(height: size.height * 0.010),
                            FormFieldWidget(
                              controller: _userNameController,
                              hintText: 'Username',
                              prefixIcon: Icons.person,
                              suffixIcon: _userNameController.text.isEmpty
                                  ? Container(width: 0.0)
                                  : IconButton(
                                      onPressed: () =>
                                          _userNameController.clear(),
                                      icon: const Icon(Icons.close, size: 20.0),
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                    ),
                              validator: usernameValidator,
                              onChanged: (value) {},
                            ),
                            SizedBox(height: size.height * 0.010),
                            FormFieldWidget(
                              controller: _passwordController,
                              hintText: 'Password',
                              prefixIcon: Icons.lock,
                              obscureText: _isPasswordVisible,
                              maxLength: 16,
                              suffixIcon: _passwordController.text.isEmpty
                                  ? Container(width: 0.0)
                                  : IconButton(
                                      onPressed: () =>
                                          togglePasswordVisibility(),
                                      icon: Icon(
                                        _isPasswordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        size: 20.0,
                                      ),
                                    ),
                              validator: passwordValidator,
                              onChanged: (value) {},
                            ),
                            SizedBox(height: size.height * 0.016),
                            MaterialButtonWidget(
                              size: size,
                              widget: _isLoading
                                  ? const SizedBox(
                                      width: 18.0,
                                      height: 18.0,
                                      child: Center(
                                        child:
                                            CircularProgressIndicator.adaptive(
                                          backgroundColor:
                                              Constants.kLightThemeColor,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Constants.kPrimaryThemeColor),
                                          strokeWidth: 4.0,
                                        ),
                                      ),
                                    )
                                  : const Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.0),
                                    ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  login(
                                      context,
                                      _userNameController.text
                                          .trim()
                                          .toString(),
                                      _passwordController.text
                                          .trim()
                                          .toString());

                                  print('Login');
                                } else {
                                  print('Error');
                                }
                                // if (_formKey.currentState!.validate()) {
                                //   setState(() {
                                //     _isLoading = true;
                                //   });
                                //   Future.delayed(const Duration(seconds: 2),
                                //       () {
                                //     Navigator.of(context).push(
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 const SamitiScreen()));
                                //   }).then((value) {
                                //     setState(() {
                                //       _isLoading = false;
                                //     });
                                //   });
                                // } else {}
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.030),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  String? passwordValidator(String? password) {
    if (password!.isEmpty) {
      return 'Required password';
    } else if (password.length < 10) {
      return 'Invalid password';
    } else {
      return null;
    }
  }

  // username validate
  String? usernameValidator(String? username) {
    if (username!.isEmpty) {
      return "Required username";
    } else if (username.length < 4) {
      return 'Invalid username';
    } else {
      return null;
    }
  }

  void login(BuildContext context, username, password) async {
    final http.Response response = await http
        .get(Uri.parse('${APIs.LOGIN_API}?u_name=$username&mobile=$password'));

    var data = jsonDecode(response.body.toString());
    try {
      if (response.statusCode == 200) {
        print('Data : ${data['status']}');
        if (data['status'] == 'true') {
          // print('Data : $data');
          print('Login successfully');

          // pageRoute(data['status']);

          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setBool('login', true);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const SamitiScreen()));
        } else {
          // print(data['message']);
          showSnackBar(context, 'ok1 ${data['message']}');
        }
      } else {
        showSnackBar(context, 'ok2 ${data['message']}');
      }
    } catch (e) {
      print(e.toString());
    }
  }



  // void pageRoute(String status) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setString('login', status);
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => const SamitiScreen()));
  // }
}
