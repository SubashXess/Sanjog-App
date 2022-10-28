// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sonjagapp/Constants/constants.dart';

class ErrorNoDataFound extends StatelessWidget {
  const ErrorNoDataFound(
      {super.key,
      required this.btnlabel,
      required this.header,
      required this.desc,
      required this.assets,
      required this.btnicon,
      required this.onPressed});

  final String btnlabel;
  final String header;
  final String desc;
  final String assets;
  final IconData btnicon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('No data found screen detect');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black87,
              size: 20.0,
            ),
            padding: EdgeInsets.zero),
      ),
      body: SizedBox(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Lottie.asset(assets.toString(),
                  repeat: true, width: size.width, height: size.height * 0.36),
              Text(
                header.toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: Constants.fontUltraLarge,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Text(
                desc.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black38,
                    fontSize: Constants.fontMedium,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 20.0),
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
                onPressed: onPressed,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      btnicon,
                      size: 16.0,
                      color: Constants.kPrimaryThemeColor,
                    ),
                    const SizedBox(width: 6.0),
                    Text(
                      btnlabel.toString(),
                      style: const TextStyle(
                        color: Constants.kPrimaryThemeColor,
                        fontWeight: FontWeight.w500,
                        fontSize: Constants.fontSmall,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
