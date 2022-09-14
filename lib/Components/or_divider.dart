import 'package:flutter/material.dart';

orDivider({Color? borderColor}) {
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
        const Text("OR"),
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
