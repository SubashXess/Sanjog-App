import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/constants.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget({
    Key? key,
    required this.size,
    required this.widget,
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final Widget widget;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Constants.kPrimaryThemeColor,
      disabledColor: Colors.red.shade200,
      minWidth: size.width,
      height: size.height * 0.06,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      child: widget,
    );
  }
}

class ElevatedIconButtonWidget extends StatelessWidget {
  const ElevatedIconButtonWidget({
    Key? key,
    required this.size,
    this.iconPadding,
    required this.icon,
    required this.label,
    required this.textDirection,
  }) : super(key: key);

  final Size size;
  final EdgeInsetsGeometry? iconPadding;
  final IconData icon;
  final String label;
  final TextDirection textDirection;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Directionality(
        textDirection: textDirection,
        child: ElevatedButton.icon(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0)),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
                side: BorderSide(color: Colors.grey.shade300, width: 1.0))),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {},
          icon: Container(
            padding: const EdgeInsets.all(3.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Constants.kLightThemeColor,
            ),
            child: Icon(
              // Icons.arrow_back_ios,
              icon,
              size: 16.0,
              color: Constants.kPrimaryThemeColor,
            ),
          ),
          label: Text(
            label.toString(),
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: Constants.fontSmall,
            ),
          ),
        ),
      ),
    );
  }
}

class OutlinedButtonWidget extends StatelessWidget {
  const OutlinedButtonWidget({
    Key? key,
    required this.size,
    required this.width,
    required this.height,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final double width, height;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: MaterialButton(
        onPressed: onPressed,
        color: Constants.kLightThemeColor,
        disabledColor: Colors.red.shade200,
        elevation: 0.0,
        minWidth: size.width,
        // height: size.height * 0.06,
        height: height,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
            side: const BorderSide(
                width: 1.0, color: Constants.kPrimaryThemeColor)),
        child: Text(
          // 'Page Samiti',
          label.toString(),
          style: const TextStyle(color: Constants.kPrimaryThemeColor),
        ),
      ),
    );
  }
}

class CircleIconButtonWidget extends StatelessWidget {
  const CircleIconButtonWidget({
    Key? key,
    this.bgcolor,
    this.bordercolor = Colors.grey,
    this.iconcolor,
    required this.assetsurl,
    required this.onTap,
    this.isPng = false,
    this.isModi = false, this.splashColor,
  }) : super(key: key);

  final Color? bgcolor, bordercolor, iconcolor, splashColor;
  final String? assetsurl;
  final VoidCallback onTap;
  final bool? isPng;
  final bool? isModi;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: bgcolor, // Button color
        child: InkWell(
          splashColor: splashColor, // Splash color
          onTap: onTap,
          child: Container(
            width: 48.0,
            height: 48.0,
            padding: isModi! ? EdgeInsets.zero : const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: bordercolor!),
              shape: BoxShape.circle,
            ),
            child: isPng!
                ? Image.asset(
                    assetsurl.toString(),
                    fit: isModi! ? BoxFit.cover : null,
                  )
                : SvgPicture.asset(
                    assetsurl.toString(),
                    color: iconcolor,
                  ),
          ),
        ),
      ),
    );
  }
}
