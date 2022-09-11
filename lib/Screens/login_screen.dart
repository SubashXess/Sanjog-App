import 'package:flutter/material.dart';
import 'package:sonjagapp/Screens/homepage.dart';

import '../Widgets/button_widget.dart';
import '../Widgets/textformfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.08),
                  Text(
                    'Sanjog'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * 0.045),
                  Container(
                    width: 145.0,
                    height: 145.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 4.0, color: Colors.red),
                      image: const DecorationImage(
                        image: AssetImage('assets/demo-girl.jpg'),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 6.0,
                          color: Colors.black26,
                          spreadRadius: 1.0,
                          offset: Offset(0.0, 2.5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.045),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                          ),
                          SizedBox(height: size.height * 0.010),
                          TextFieldWidget(
                            size: size,
                            label: 'Username',
                            controller: _userNameController,
                            keyboardType: TextInputType.text,
                            maxLength: 40,
                            onChanged: (value) {},
                          ),
                          SizedBox(height: size.height * 0.010),
                          TextFieldWidget(
                            size: size,
                            label: 'Mobile number',
                            controller: _mobileController,
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            onChanged: (value) {},
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
                              setState(() {
                                _isLoading = true;
                              });
                              Future.delayed(const Duration(seconds: 2), () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                              }).then((value) {
                                setState(() {
                                  _isLoading = false;
                                });
                              });
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
}
