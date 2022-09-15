// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

import '../Constants/constants.dart';

class SmallCardDesignOne extends StatelessWidget {
  const SmallCardDesignOne(
      {super.key, this.cardColor, this.label, this.value, this.labelColor});

  final Color? cardColor;
  final String? label;
  final String? value;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: cardColor,
      ),
      child: Text(
        // 'Page No: 3',
        '${label} ${value}',
        style: TextStyle(
          color: labelColor,
          fontSize: Constants.fontSmall,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
