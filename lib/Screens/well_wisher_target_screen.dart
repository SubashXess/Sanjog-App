import 'package:flutter/material.dart';

class WellWisherTargetScreen extends StatefulWidget {
  const WellWisherTargetScreen({super.key});

  @override
  State<WellWisherTargetScreen> createState() => _WellWisherTargetScreenState();
}

class _WellWisherTargetScreenState extends State<WellWisherTargetScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Well Wisher Target'),
      ),
    );
  }
}
