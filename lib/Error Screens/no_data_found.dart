import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sonjagapp/Constants/constants.dart';

class ErrorNoDataFound extends StatelessWidget {
  const ErrorNoDataFound({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/raw/nodata.json',
                repeat: true, width: size.width),
            const Text(
              'No Data',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: Constants.fontUltraLarge,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6.0),
            const Text(
              'Maybe go back and try a different Booth number?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black26,
                  fontSize: Constants.fontMedium,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10.0),
            MaterialButton(
              color: Constants.kLightThemeColor,
              elevation: 0.0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minWidth: size.width * 0.36,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
              focusElevation: 0.0,
              highlightElevation: 0.0,
              highlightColor: Constants.kPrimaryThemeColor.withOpacity(0.26),
              splashColor: Constants.kPrimaryThemeColor.withOpacity(0.26),
              onPressed: () => Navigator.pop(context),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.arrow_back,
                    size: 16.0,
                    color: Constants.kPrimaryThemeColor,
                  ),
                  SizedBox(width: 6.0),
                  Text(
                    'Go back',
                    style: TextStyle(
                      color: Constants.kPrimaryThemeColor,
                      fontWeight: FontWeight.w500,
                      fontSize: Constants.fontRegular,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
