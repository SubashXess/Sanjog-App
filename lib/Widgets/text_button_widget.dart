import 'package:flutter/material.dart';
import 'package:sonjagapp/Constants/constants.dart';

class NormalTextButtonWidget extends StatelessWidget {
  final String? label;
  final Function()? onPressed;
  final double? fontSize;
  const NormalTextButtonWidget({
    Key? key,
    this.label,
    this.onPressed,
    this.fontSize = Constants.fontSmall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 6.0)),
        // backgroundColor: MaterialStateProperty.all(Colors.deepPurple[200]),
        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        label.toString(),
        style: TextStyle(
          color: Constants.kPrimaryThemeColor,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
