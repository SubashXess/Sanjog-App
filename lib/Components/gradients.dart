import 'package:flutter/material.dart';

import '../Constants/constants.dart';

gradientColor() {
  return const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Constants.kPrimaryThemeColor,
      Color(0xFFF97D09)
    ], // Color(0xFFF97D09)
  );
}
