import 'package:flutter/material.dart';

class SearchByVoterIdScreen extends StatefulWidget {
  const SearchByVoterIdScreen({super.key});

  @override
  State<SearchByVoterIdScreen> createState() => _SearchByVoterIdScreenState();
}

class _SearchByVoterIdScreenState extends State<SearchByVoterIdScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Search by Voter ID'),
      ),
    );
  }
}
