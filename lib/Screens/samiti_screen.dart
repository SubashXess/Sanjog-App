import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Constants/constants.dart';
import '../Widgets/button_widget.dart';

class SamitiScreen extends StatelessWidget {
  const SamitiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sanjog Ekamra'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Constants.kPrimaryThemeColor,
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
      ),
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButtonWidget(
                      size: size,
                      width: size.width / 2.5,
                      height: size.height * 0.06,
                      label: 'Page Samiti',
                      onPressed: () {
                        AlertDialog(
                          title: Column(
                            children: [
                              Text(
                                "Entry through voter list",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Constants.fontRegular,
                                ),
                              ),
                            ],
                          ),
                        );
                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return AlertDialog(
                        //       content: Column(
                        //         children: [
                        //           Text(
                        //             "Entry through voter list",
                        //             style: TextStyle(
                        //               color: Colors.black,
                        //               fontSize: Constants.fontRegular,
                        //             ),
                        //           ),
                        //           Text(
                        //             "Entry through voter list",
                        //             style: TextStyle(
                        //               color: Colors.black,
                        //               fontSize: Constants.fontRegular,
                        //             ),
                        //           ),
                        //           Text(
                        //             "Entry through voter list",
                        //             style: TextStyle(
                        //               color: Colors.black,
                        //               fontSize: Constants.fontRegular,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        // );
                      },
                    ),
                    SizedBox(width: size.width * 0.04),
                    OutlinedButtonWidget(
                      size: size,
                      width: size.width / 2.5,
                      height: size.height * 0.06,
                      label: 'Page Samiti',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                width: double.infinity,
                height: size.height * 0.4,
                child: Image.asset(
                  'assets/image-1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                width: double.infinity,
                // alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
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
                      onTap: () {},
                    ),
                    CircleIconButtonWidget(
                      bgcolor: const Color(0xFFECF7FE),
                      bordercolor: const Color(0xFF1DA1F2),
                      splashColor: const Color(0xFF8BCFF8),
                      iconcolor: const Color(0xFF1DA1F2),
                      assetsurl: 'assets/svg/twitter.svg',
                      onTap: () {},
                    ),
                    CircleIconButtonWidget(
                      bgcolor: const Color(0xFFF6EFFA),
                      bordercolor: const Color(0xFF8a3ab9),
                      splashColor: const Color(0xFFCAA2E2),
                      // iconcolor: const Color(0xffbc2a8d),
                      isPng: true,
                      assetsurl: 'assets/icons/instagram.png',
                      onTap: () {},
                    ),
                    CircleIconButtonWidget(
                      bgcolor: const Color(0xFFFFEBEB),
                      bordercolor: const Color(0xFFFF0000),
                      splashColor: const Color(0xFFFF8585),
                      // iconcolor: Colors.white,
                      assetsurl: 'assets/svg/youtube.svg',
                      onTap: () {},
                    ),
                    CircleIconButtonWidget(
                      bgcolor: const Color(0xFFFEF4EB),
                      bordercolor: const Color(0xFFF97D09),
                      splashColor: const Color(0xFFF9BE8B),
                      // iconcolor: Colors.blue,
                      isPng: true,
                      isModi: true,
                      assetsurl: 'assets/modi.png',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  // void _showDialogBox(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return Card();
  //     },
  //   );
  // }
}
