// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:sonjagapp/Screens/entry_through_voter_search.dart';
import 'package:sonjagapp/Screens/entrythroughvoterlist_screen.dart';
import 'package:sonjagapp/Screens/login_screen.dart';
import 'package:sonjagapp/Screens/page_samiti_list.dart';
import 'package:sonjagapp/Screens/search_screen.dart';
import 'package:sonjagapp/Screens/well_wisher_target.dart';
import '../Components/showsnackbar.dart';
import '../Constants/constants.dart';
import '../Widgets/button_widget.dart';

class SamitiScreen extends StatefulWidget {
  const SamitiScreen({super.key});

  @override
  State<SamitiScreen> createState() => _SamitiScreenState();
}

class _SamitiScreenState extends State<SamitiScreen> {
  int _currentScreenIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sanjog Ekamra'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Constants.kPrimaryThemeColor,
        elevation: 2.0,
        actions: [
          Badge(
            badgeContent: const Text(
              '1',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                  fontWeight: FontWeight.normal),
            ),
            badgeColor: Colors.blue,
            position: BadgePosition.topEnd(top: 6.0, end: -6.0),
            child: const Icon(
              Icons.notifications,
              size: 20.0,
            ),
          ),
          PopupMenuButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0)),
            iconSize: 20.0,
            position: PopupMenuPosition.under,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 0,
                  height: 20.0,
                  onTap: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.power_settings_new,
                        color: Colors.black,
                        size: 18.0,
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        'Logout',
                        style: TextStyle(
                            color: Colors.black, fontSize: Constants.fontSmall),
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Constants.kPrimaryThemeColor,
                  Color(0xFFF97D09)
                ], // Color(0xFFF97D09)
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: size.height,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/bg-3.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PopupMenuButton<int>(
                    position: PopupMenuPosition.under,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    tooltip: 'Page samiti',
                    onSelected: (page) {
                      // if (page == _currentScreenIndex) {
                      //   print('data ${_samitiScreenData[page]}');
                      // } else {
                      //   print('no data');
                      // }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => _samitiScreenData[page]));
                    },
                    itemBuilder: (context) {
                      return List.generate(_pageSamitiItems.length, (index) {
                        return PopupMenuItem<int>(
                          value: index,
                          padding: const EdgeInsets.all(10.0),
                          child: Text(_pageSamitiItems[index].toString()),
                          onTap: () {
                            setState(() {
                              _currentScreenIndex = index;
                            });
                          },
                        );
                      });
                    },
                    child: Container(
                      width: size.width / 2.5,
                      height: size.height * 0.06,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(
                            width: 1.0, color: Constants.kPrimaryThemeColor),
                        color: Constants.kLightThemeColor,
                      ),
                      child: const Text(
                        'Page Samiti',
                        style: TextStyle(
                          color: Constants.kPrimaryThemeColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.04),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WellWisherTarget()));
                    },
                    child: Container(
                      width: size.width / 2.5,
                      height: size.height * 0.06,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(
                            width: 1.0, color: Constants.kPrimaryThemeColor),
                        color: Constants.kLightThemeColor,
                      ),
                      child: const Text(
                        'Well Wisher',
                        style: TextStyle(
                          color: Constants.kPrimaryThemeColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  //  Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => const WellWisherTarget()));
                  // PopupMenuButton(
                  //   position: PopupMenuPosition.under,
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(6.0)),
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 10.0, vertical: 10.0),
                  //   tooltip: 'Well wisher',
                  //   onSelected: (page) {

                  //   },
                  //   itemBuilder: (context) {
                  //     return List.generate(_wellWisherItems.length, (index) {
                  //       return PopupMenuItem(
                  //         padding: const EdgeInsets.all(10.0),
                  //         child: Text(_wellWisherItems[index].toString()),
                  //         onTap: () {},
                  //       );
                  //     });
                  //   },
                  //   child: Container(
                  //     width: size.width / 2.5,
                  //     height: size.height * 0.06,
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 10.0, vertical: 10.0),
                  //     alignment: Alignment.center,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(6.0),
                  //       border: Border.all(
                  //           width: 1.0, color: Constants.kPrimaryThemeColor),
                  //       color: Constants.kLightThemeColor,
                  //     ),
                  //     child: const Text(
                  //       'Well Wisher',
                  //       style: TextStyle(
                  //         color: Constants.kPrimaryThemeColor,
                  //         fontWeight: FontWeight.w500,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Wrap(
                spacing: 10.0,
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 10.0,
                children: [
                  CircleIconButtonWidget(
                    bgcolor: const Color(0xFFF0F3F9),
                    bordercolor: const Color(0xFF4267B2),
                    iconcolor: const Color(0xFF4267B2),
                    splashColor: const Color(0xFFA6B8DE),
                    assetsurl: 'assets/svg/facebook-f.svg',
                    onTap: () {
                      facebookLauncher();
                    },
                  ),
                  CircleIconButtonWidget(
                    bgcolor: const Color(0xFFECF7FE),
                    bordercolor: const Color(0xFF1DA1F2),
                    splashColor: const Color(0xFF8BCFF8),
                    iconcolor: const Color(0xFF1DA1F2),
                    assetsurl: 'assets/svg/twitter.svg',
                    onTap: () {
                      twetterLauncher();
                    },
                  ),
                  CircleIconButtonWidget(
                    bgcolor: const Color(0xFFF6EFFA),
                    bordercolor: const Color(0xFF8a3ab9),
                    splashColor: const Color(0xFFCAA2E2),
                    // iconcolor: const Color(0xffbc2a8d),
                    isPng: true,
                    assetsurl: 'assets/icons/instagram.png',
                    onTap: () {
                      instagramLauncher();
                    },
                  ),
                  CircleIconButtonWidget(
                    bgcolor: const Color(0xFFFFEBEB),
                    bordercolor: const Color(0xFFFF0000),
                    splashColor: const Color(0xFFFF8585),
                    // iconcolor: Colors.white,
                    assetsurl: 'assets/svg/youtube.svg',
                    onTap: () {
                      youtubeLauncher();
                    },
                  ),
                  CircleIconButtonWidget(
                    bgcolor: const Color(0xFFFEF4EB),
                    bordercolor: const Color(0xFFF97D09),
                    splashColor: const Color(0xFFF9BE8B),
                    // iconcolor: Colors.blue,
                    isPng: true,
                    isModi: true,
                    assetsurl: 'assets/modi.png',
                    onTap: () {
                      modiLauncher();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final _samitiScreenData = const [
    EntryThroughVoterListScreen(),
    EntryThroughVoterSearch(),
    PageSamitiList(),
  ];

  // Future<void> _openHomePage(BuildContext context) async {
  //   print('home');
  //   await Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => const HomePage()));
  //   print('home completed');
  // }

  final List<String> _pageSamitiItems = [
    'Entry through voter list',
    'Entry through voter search',
    'Page samiti list',
  ];

  final List<String> _wellWisherItems = [
    'Well wisher target',
  ];

  void facebookLauncher() async {}

  void twetterLauncher() {}

  void instagramLauncher() {}

  void youtubeLauncher() {}

  void modiLauncher() {}
}
