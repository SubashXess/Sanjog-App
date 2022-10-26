// ignore_for_file: avoid_print

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:sonjagapp/Components/or_divider.dart';
import 'package:sonjagapp/Screens/notification_screen.dart';
import 'package:sonjagapp/Screens/search_by_voter_id_screen.dart';
import 'package:sonjagapp/Screens/search_samiti_list_screen.dart';
import 'package:sonjagapp/Screens/search_screen.dart';
import 'package:sonjagapp/Screens/voter_list_screen.dart';
import 'package:sonjagapp/Screens/well_wisher_target_screen.dart';
import 'package:sonjagapp/Services/service.dart';
import 'package:sonjagapp/Widgets/textformfield_widget.dart';
import '../Constants/constants.dart';
import '../Widgets/button_widget.dart';

class SamitiScreen extends StatefulWidget {
  const SamitiScreen({super.key});

  @override
  State<SamitiScreen> createState() => _SamitiScreenState();
}

class _SamitiScreenState extends State<SamitiScreen> {
  // form validate global state
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // TextEditingController
  final TextEditingController _boothNoController = TextEditingController();
  final TextEditingController _pageNoController = TextEditingController();

  // FocusNode
  late FocusNode _boothNoNode;
  late FocusNode _pageNoNode;

  // Variables
  String? status;
  bool _autovalidateMode = false;

  @override
  void initState() {
    _boothNoNode = FocusNode()..addListener(onListen);
    _pageNoNode = FocusNode()..addListener(onListen);
    _boothNoController.addListener(onListen);
    _pageNoController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _boothNoController.dispose();
    _boothNoController.removeListener(onListen);
    _pageNoController.dispose();
    _pageNoController.removeListener(onListen);
    _boothNoNode.dispose();
    _boothNoNode.removeListener(onListen);
    _pageNoNode.dispose();
    _pageNoNode.removeListener(onListen);
  }

  void onListen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sanjog Ekmara'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          // backgroundColor: Constants.kPrimaryThemeColor,
          elevation: 1.0,
          actions: [
            InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  print('Search');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SearchScreen()));
                },
                child: const Icon(Icons.search, size: 20.0)),
            const SizedBox(width: 10.0),
            Badge(
              badgeContent: const Text(
                '1',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold),
              ),
              badgeColor: Colors.white38,
              elevation: 0.0,
              position: BadgePosition.topEnd(top: 6.0, end: -6.0),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  print('Notification');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const NotificationScreen()));
                },
                child: const Icon(
                  Icons.notifications,
                  size: 20.0,
                ),
              ),
            ),
            PopupMenuButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
              iconSize: 20.0,
              position: PopupMenuPosition.under,
              itemBuilder: (_) {
                return [
                  PopupMenuItem(
                    value: 0,
                    height: 20.0,
                    onTap: () {
                      ApiClient.logout(context);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.power_settings_new,
                          color: Constants.kPrimaryThemeColor,
                          size: 18.0,
                        ),
                        SizedBox(width: 6.0),
                        Text(
                          'Logout',
                          style: TextStyle(
                              color: Constants.kPrimaryThemeColor,
                              fontSize: Constants.fontSmall,
                              fontWeight: FontWeight.bold),
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
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 16.0),
                      child: SizedBox(
                        // color: Colors.red,
                        width: size.width,
                        child: Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: size.width,
                                    child: const Text(
                                      'Search by voter list',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: Constants.fontUltraLarge,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.02),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Assembly',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(height: 10.0),
                                      SizedBox(
                                        height: 50,
                                        width: size.width,
                                        child: Card(
                                          color: Colors.grey.shade200,
                                          margin: EdgeInsets.zero,
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6.0)),
                                          child: const Center(
                                            child: Text(
                                              'ଏକାମ୍ର ଭୁବନେଶ୍ବର',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize:
                                                      Constants.fontRegular,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10.0),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: FormFieldWidget(
                                          controller: _boothNoController,
                                          autovalidateMode: _autovalidateMode
                                              ? AutovalidateMode
                                                  .onUserInteraction
                                              : AutovalidateMode.disabled,
                                          focusNode: _boothNoNode,
                                          hintText: 'Booth number',
                                          isPrefixIcon: false,
                                          isSuffixIcon: false,
                                          maxLength: 3,
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Required';
                                            } else {
                                              return null;
                                            }
                                          },
                                          onChanged: (value) {},
                                        ),
                                      ),
                                      // const SizedBox(width: 10.0),
                                      // Expanded(
                                      //   child: FormFieldWidget(
                                      //     controller: _pageNoController,
                                      //     focusNode: _pageNoNode,
                                      //     autovalidateMode: _autovalidateMode
                                      //         ? AutovalidateMode
                                      //             .onUserInteraction
                                      //         : AutovalidateMode.disabled,
                                      //     hintText: 'Page number',
                                      //     keyboardType: TextInputType.number,
                                      //     maxLength: 3,
                                      //     isPrefixIcon: false,
                                      //     isSuffixIcon: false,
                                      //     suffixText: '31',
                                      //     validator: (value) {
                                      //       if (value!.isEmpty) {
                                      //         return 'Required';
                                      //       } else {
                                      //         return null;
                                      //       }
                                      //     },
                                      //     onChanged: (value) {},
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  SizedBox(height: size.height * 0.02),
                                  MaterialButtonWidget(
                                    size: size,
                                    widget: const Text(
                                      'Search',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Constants.fontRegular),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          _autovalidateMode = false;
                                          _boothNoNode.unfocus();
                                          _pageNoNode.unfocus();
                                        });

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => VoterListScreen(
                                              boothNo: _boothNoController.text
                                                  .trim()
                                                  .toString(),
                                              pageNo: _pageNoController.text
                                                  .toString(),
                                            ),
                                          ),
                                        );
                                      } else {
                                        setState(() {
                                          _autovalidateMode = true;
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            orDivider(
                                label: Text(
                              'Or',
                              style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: Constants.fontRegular,
                                  fontWeight: FontWeight.w500),
                            )),
                            SizedBox(height: size.height * 0.02),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.grey.shade500,
                                    Colors.grey.shade300
                                  ], // Color(0xFFF97D09)
                                ),
                              ),
                              child: MaterialButton(
                                color: Colors.transparent,
                                elevation: 0.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0)),
                                height: size.height * 0.065,
                                minWidth: size.width,
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const SearchByVoterIdScreen())),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Search by Voter ID',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Constants.fontRegular),
                                    ),
                                    SizedBox(width: 10.0),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 16.0,
                                      color: Colors.white54,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.grey.shade500,
                                    Colors.grey.shade300
                                  ], // Color(0xFFF97D09)
                                ),
                              ),
                              child: MaterialButton(
                                color: Colors.transparent,
                                elevation: 0.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0)),
                                height: size.height * 0.065,
                                minWidth: size.width,
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const SearchSamitiListScreen())),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Search Samiti List',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Constants.fontRegular),
                                    ),
                                    SizedBox(width: 10.0),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 16.0,
                                      color: Colors.white54,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.grey.shade500,
                                    Colors.grey.shade300
                                  ], // Color(0xFFF97D09)
                                ),
                              ),
                              child: MaterialButton(
                                color: Colors.transparent,
                                elevation: 0.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0)),
                                height: size.height * 0.065,
                                minWidth: size.width,
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const WellWisherTargetScreen())),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Well Wisher Target',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Constants.fontRegular),
                                    ),
                                    SizedBox(width: 10.0),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 16.0,
                                      color: Colors.white54,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width,
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: size.height * 0.02),
                        orDivider(
                            label: const Text(
                          'Connect with us',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Constants.fontMedium,
                              fontWeight: FontWeight.w500),
                        )),
                        SizedBox(height: size.height * 0.02),
                        Wrap(
                          spacing: 10.0,
                          alignment: WrapAlignment.spaceBetween,
                          runSpacing: 10.0,
                          children: [
                            CircleIconButtonWidget(
                              // bgcolor: const Color(0xFFF0F3F9),
                              bgcolor: Colors.white70,
                              bordercolor: const Color(0xFF4267B2),
                              iconcolor: const Color(0xFF4267B2),
                              splashColor: const Color(0xFFA6B8DE),
                              assetsurl: 'assets/svg/facebook-f.svg',
                              onTap: ()=> SocialLink.openFacebook(),
                            ),
                            CircleIconButtonWidget(
                              // bgcolor: const Color(0xFFECF7FE),
                              bgcolor: Colors.white70,
                              bordercolor: const Color(0xFF1DA1F2),
                              splashColor: const Color(0xFF8BCFF8),
                              iconcolor: const Color(0xFF1DA1F2),
                              assetsurl: 'assets/svg/twitter.svg',
                              onTap: () => SocialLink.openTwitter(),
                            ),
                            CircleIconButtonWidget(
                              // bgcolor: const Color(0xFFF6EFFA),
                              bgcolor: Colors.white70,
                              bordercolor: const Color(0xFF8a3ab9),
                              splashColor: const Color(0xFFCAA2E2),
                              // iconcolor: const Color(0xffbc2a8d),
                              isPng: true,
                              assetsurl: 'assets/icons/instagram.png',
                              onTap: ()=> SocialLink.openInstagram(),
                            ),
                            CircleIconButtonWidget(
                              // bgcolor: const Color(0xFFFFEBEB),
                              bgcolor: Colors.white70,
                              bordercolor: const Color(0xFFFF0000),
                              splashColor: const Color(0xFFFF8585),
                              // iconcolor: Colors.white,
                              assetsurl: 'assets/svg/youtube.svg',
                              onTap: () =>  SocialLink.openYoutube(),
                            ),
                            CircleIconButtonWidget(
                              // bgcolor: const Color(0xFFFEF4EB),
                              bgcolor: Colors.white70,
                              bordercolor: const Color(0xFFF97D09),
                              splashColor: const Color(0xFFF9BE8B),
                              // iconcolor: Colors.blue,
                              isPng: true,
                              isModi: true,
                              assetsurl: 'assets/modi.png',
                              onTap: () =>  SocialLink.openModi(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void getLoginCred() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     status = preferences.getString('login');
  //   });
  // }
}
