import 'package:flutter/material.dart';

orDivider({Color? borderColor, Widget? label}) {
  return SizedBox(
    width: double.infinity,
    child: Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 10.0),
            child:  Divider(
              color: borderColor,
              height: 36,
            ),
          ),
        ),
        label!,
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10.0),
            child:  Divider(
              color: borderColor,
              height: 36,
            ),
          ),
        ),
      ],
    ),
  );
}

orDividerShade({required Widget label, required Color lineColor}) {
  return SizedBox(
    width: double.infinity,
    child: Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: Divider(
              color: lineColor,
              height: 36,
            ),
          ),
        ),
        label,
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Divider(
              color: lineColor,
              height: 36,
            ),
          ),
        ),
      ],
    ),
  );
}

