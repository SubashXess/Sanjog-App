import 'package:flutter/material.dart';
import 'package:sonjagapp/Screens/add_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanjog App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: const AddDetailsScreen(
        voterId: 'YXV0934471',
        acNo: '111',
      ),
    );
  }
}
