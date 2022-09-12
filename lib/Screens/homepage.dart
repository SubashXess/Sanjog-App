// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sonjagapp/Components/showsnackbar.dart';
import 'package:sonjagapp/Screens/search_screen.dart';
import 'package:sonjagapp/Screens/voter_details_card_widget.dart';
import 'package:sonjagapp/Widgets/button_widget.dart';
import 'package:sonjagapp/Widgets/textformfield_widget.dart';

import '../Constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // form validate global state
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // text field controller
  final TextEditingController _assemblyController = TextEditingController();
  final TextEditingController _boothNoController = TextEditingController();
  final TextEditingController _pageNoController = TextEditingController();

  late Timer _timer;
  bool _isVerified = false;
  bool _isLoading = false;
  bool _isError = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leadingWidth: 36.0,
          titleSpacing: 0.0,
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                size: 20.0,
                color: Colors.white,
              )),
          centerTitle: true,
          title: const Text(
            'Entry through Voter List',
            style:
                TextStyle(color: Colors.white, fontSize: Constants.fontLarge),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchScreen()));
                },
                child: const Icon(
                  Icons.search,
                  size: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          height: size.height,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Card(
                        color: Colors.white,
                        margin: EdgeInsets.zero,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Assembly',
                                      style: TextStyle(
                                        fontSize: Constants.fontRegular,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.012),
                                    TextFormFieldWidget(
                                      size: size,
                                      controller: _assemblyController,
                                      hintText: 'Assembly',
                                      textInputType: TextInputType.text,
                                      onChanged: (value) {},
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Required';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height * 0.012),
                              SizedBox(
                                width: size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Booth Number',
                                      style: TextStyle(
                                        fontSize: Constants.fontRegular,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.012),
                                    TextFormFieldWidget(
                                      size: size,
                                      controller: _boothNoController,
                                      hintText: 'Booth number',
                                      textInputType: TextInputType.number,
                                      onChanged: (value) {},
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Required';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height * 0.012),
                              SizedBox(
                                width: size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Page Number',
                                      style: TextStyle(
                                        fontSize: Constants.fontRegular,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.012),
                                    TextFormFieldWidget(
                                      size: size,
                                      controller: _pageNoController,
                                      hintText: 'Page number',
                                      textInputType: TextInputType.number,
                                      onChanged: (value) {},
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Required';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height * 0.02),
                              MaterialButtonWidget(
                                  size: size,
                                  widget: _isLoading
                                      ? const SizedBox(
                                          width: 28.0,
                                          height: 28.0,
                                          child: Center(
                                            child: CircularProgressIndicator
                                                .adaptive(
                                              backgroundColor: Colors.white,
                                              strokeWidth: 4.0,
                                            ),
                                          ),
                                        )
                                      : _isVerified
                                          ? const Icon(
                                              Icons.check_circle_sharp,
                                              color: Colors.white,
                                              size: 28.0,
                                            )
                                          : _isError
                                              ? const Text(
                                                  'Failed to Load',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        Constants.fontRegular,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              : const Text(
                                                  'Load',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        Constants.fontRegular,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      print('Success');
                                      load();

                                      Future.delayed(
                                        const Duration(seconds: 2),
                                        () {
                                          showSnackBar(context, 'Success');
                                        },
                                      );
                                    } else {
                                      print('Error');
                                      setState(() {
                                        _isError = true;
                                        _isLoading = false;
                                        _isVerified = false;
                                      });
                                      showSnackBar(context, 'Required');
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.026),
                    VoterDetailsCard(size: size),
                    SizedBox(height: size.height * 0.026),
                    Row(
                      children: [
                        ElevatedIconButtonWidget(
                          size: size,
                          textDirection: TextDirection.ltr,
                          icon: Icons.arrow_back,
                          label: 'Previous Page',
                        ),
                        const SizedBox(width: 10),
                        ElevatedIconButtonWidget(
                          size: size,
                          textDirection: TextDirection.rtl,
                          // iconPadding: const EdgeInsets.only(right: 5.0),
                          icon: Icons.arrow_back,
                          label: 'Next Page',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  load() {
    setState(() {
      _isLoading = true;
    });
    const oneSec = Duration(seconds: 2);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        _isLoading = false;
        _isVerified = true;
      });
      _timer.cancel();
    });
  }

  // errorShow() {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   const oneSec = Duration(seconds: 2);
  //   _timer = Timer.periodic(oneSec, (timer) {
  //     setState(() {
  //       _isError = true;
  //       _isLoading = false;
  //       _isVerified = false;
  //     });
  //     _timer.cancel();
  //   });
  // }
}
