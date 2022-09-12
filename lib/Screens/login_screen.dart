// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sonjagapp/Screens/homepage.dart';
import 'package:sonjagapp/Constants/constants.dart';
import 'package:sonjagapp/Screens/samiti_screen.dart';

import '../Widgets/button_widget.dart';
import '../Widgets/dropdown_widget.dart';
import '../Widgets/textformfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  // form validate global state
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _userLevelController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late AnimationController animationController;
  bool _isPasswordVisible = true;
  bool _isLoading = false;

  // Initial Selected Value
  String defaultValue = '';

  @override
  void initState() {
    super.initState();
    _userNameController.addListener(onListen);
    _passwordController.addListener(onListen);
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animationController.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    // _userLevelController.dispose();
    _userNameController.removeListener(onListen);
    _userNameController.dispose();
    _passwordController.removeListener(onListen);
    _passwordController.dispose();
    animationController.dispose();
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
                      color: Constants.kLightThemeColor,
                      border: Border.all(
                          width: 4.0, color: Constants.kPrimaryThemeColor),
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
                          SizedBox(
                            width: size.width,
                            child: DropdownButtonFormField<String>(
                              value:
                                  defaultValue.isNotEmpty ? defaultValue : null,
                              hint: Text(
                                'User level',
                                style: TextStyle(
                                    color: Constants.kSecondaryThemeColor
                                        .withOpacity(0.6),
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
                                  return 'Required';
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
                                    icon: const Icon(
                                      Icons.close,
                                      color: Constants.kPrimaryThemeColor,
                                    ),
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
                            suffixIcon: _passwordController.text.isEmpty
                                ? Container(width: 0.0)
                                : IconButton(
                                    onPressed: () => togglePasswordVisibility(),
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      size: 20.0,
                                    ),
                                  ),
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
                                      child: CircularProgressIndicator.adaptive(
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

  void togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

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
}
