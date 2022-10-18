import 'package:flutter/material.dart';
import 'package:sonjagapp/Constants/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Positioned(
            //   top: 0.0,
            //   left: 0.0,
            //   child: Image.asset(
            //     'assets/images/signup_top.png',
            //     width: size.width * 0.3,
            //   ),
            // ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              child: Image.asset(
                'assets/images/main_bottom.png',
                width: size.width * 0.2,
                color: Constants.kPrimaryThemeColor,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'assets/images/login_bottom.png',
                width: size.width * 0.35,
                color: const Color(0xFFF97D09).withAlpha(120),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
