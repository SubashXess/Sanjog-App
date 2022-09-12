// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sonjagapp/Screens/homepage.dart';
import 'package:sonjagapp/Constants/constants.dart';
import 'package:sonjagapp/Screens/samiti_screen.dart';

import '../Widgets/button_widget.dart';
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
  final TextEditingController _mobileController = TextEditingController();

  bool _isLoading = false;

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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg-2.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black12,
                BlendMode.darken,
              ),
            ),
          ),
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
                      border: Border.all(
                          width: 4.0, color: Constants.kLightThemeColor),
                      image: const DecorationImage(
                        image: AssetImage('assets/pic-1.jpeg'),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Colors.black38,
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
                          TextFieldWidget(
                            size: size,
                            label: 'User Level',
                            controller: _userLevelController,
                            keyboardType: TextInputType.text,
                            maxLength: 40,
                            onChanged: (value) {},
                            validator: userLevelvalidator,
                          ),
                          SizedBox(height: size.height * 0.010),
                          TextFieldWidget(
                            size: size,
                            label: 'Username',
                            controller: _userNameController,
                            keyboardType: TextInputType.text,
                            maxLength: 40,
                            onChanged: (value) {},
                            validator: usernameValidator,
                          ),
                          SizedBox(height: size.height * 0.010),
                          TextFieldWidget(
                            size: size,
                            label: 'Password',
                            controller: _mobileController,
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            onChanged: (value) {},
                            validator: phoneValidator,
                          ),
                          SizedBox(height: size.height * 0.016),
                          MaterialButtonWidget(
                            size: size,
                            widget: _isLoading
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Login',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0),
                                      ),
                                      SizedBox(width: 16.0),
                                      SizedBox(
                                        width: 18.0,
                                        height: 18.0,
                                        child: Center(
                                          child: CircularProgressIndicator
                                              .adaptive(
                                            backgroundColor: Colors.white,
                                            strokeWidth: 4.0,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : const Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15.0),
                                  ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });
                                Future.delayed(const Duration(seconds: 2), () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const SamitiScreen()));
                                }).then((value) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                });
                              } else {}
                              // setState(() {
                              //   _isLoading = true;
                              // });
                              // Future.delayed(const Duration(seconds: 2), () {
                              //   Navigator.of(context).push(MaterialPageRoute(
                              //       builder: (context) => const HomePage()));
                              // }).then((value) {
                              //   setState(() {
                              //     _isLoading = false;
                              //   });
                              // });
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
    );
  }

  Future login() async {
    var url = "${APIs.DBAPI}user_login";
  }

  String? userLevelvalidator(String? value) {}

  // username validate
  String? usernameValidator(String? username) {
    if (username!.isEmpty) {
      return "Required username";
    } else if (username == 'Subash123') {
      // bool result = checkUsername(username);
      // if (result) {
      //   // action perform

      //   print("Username : $result");
      // } else {
      //   return "Invalid username";
      // }
    } else {
      return 'Invalid username';
    }
    return null;
  }

  bool checkUsername(String value) {
    Pattern pattern =
        r"^(?=.{4,20}$)(?:[a-zA-Z\d]+(?:(?:\.|-|_)[a-zA-Z\d])*)+$";
    RegExp regExp = RegExp(pattern.toString());
    return (!regExp.hasMatch(value)) ? false : true;
  }

  // phone valitate
  static String? phoneValidator(String? phone) {
    if (phone!.isEmpty) {
      return "Required phone"; // (      )
    } else {
      bool result = checkPhone(phone);
      if (result) {
        // perform action
        print("Phone No : $result");
      } else {
        return "Invalid phone number";
      }
    }
    return null;
  }

  static bool checkPhone(String value) {
    Pattern pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern.toString());
    return (!regExp.hasMatch(value)) ? false : true;
  }
}
