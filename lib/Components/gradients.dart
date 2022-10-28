import 'package:flutter/material.dart';

import '../Constants/constants.dart';

LinearGradient gradientColor() {
  return const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Constants.kPrimaryThemeColor,
      Color(0xFFF97D09)
    ], // Color(0xFFF97D09)
  );
}

LinearGradient gradientColor2(
    {AlignmentGeometry? begin = Alignment.topLeft,
    end = Alignment.bottomRight,
    Color? color1 = Constants.kPrimaryThemeColor,
    color2 = const Color(0xFFF97D09)}) {
  return LinearGradient(
    begin: begin!,
    end: end!,
    colors: [
      color1!,
      color2!,
      // Constants.kPrimaryThemeColor,
      // Color(0xFFF97D09)
    ], // Color(0xFFF97D09)
  );
}
