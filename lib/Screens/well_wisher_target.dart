import 'package:flutter/material.dart';

class WellWisherTarget extends StatefulWidget {
  const WellWisherTarget({super.key});

  @override
  State<WellWisherTarget> createState() => _WellWisherTargetState();
}

class _WellWisherTargetState extends State<WellWisherTarget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
