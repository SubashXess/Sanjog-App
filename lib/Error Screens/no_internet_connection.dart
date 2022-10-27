import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sonjagapp/Constants/constants.dart';

class NoInternetConnectionError extends StatelessWidget {
  const NoInternetConnectionError({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              const SizedBox(height: 20.0),
              Lottie.asset(
                'assets/raw/no_internet.json',
                repeat: true,
                width: size.width,
                height: size.height * 0.26,
              ),
              SizedBox(height: size.height * 0.12),
              const Text(
                'No Internet Connection',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Constants.fontUltraLarge,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Please check your internet connection\nand try again.',
                textAlign: TextAlign.center,
                style: TextStyle(
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
                onPressed: () {},
                child: const Text(
                  'Try Again',
                  style: TextStyle(
                    color: Constants.kPrimaryThemeColor,
                    fontWeight: FontWeight.w500,
                    fontSize: Constants.fontSmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
