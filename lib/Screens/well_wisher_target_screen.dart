// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sonjagapp/Test%20Screens/test_provider.dart';

class WellWisherTargetScreen extends StatefulWidget {
  const WellWisherTargetScreen({super.key});

  @override
  State<WellWisherTargetScreen> createState() => _WellWisherTargetScreenState();
}

class _WellWisherTargetScreenState extends State<WellWisherTargetScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Well Wisher Target'),
              InkWell(
                onTap: () async {
                  Provider.of<TestProvider>(context, listen: false)
                      .getVoterData(context, '3');
                  Navigator.pop(context, true);
                  setState(() {});
                  print('rebuild again');
                },
                child: Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
