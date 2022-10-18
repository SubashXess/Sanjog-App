import 'package:flutter/material.dart';

class SearchSamitiListScreen extends StatefulWidget {
  const SearchSamitiListScreen({super.key});

  @override
  State<SearchSamitiListScreen> createState() => _SearchSamitiListScreenState();
}

class _SearchSamitiListScreenState extends State<SearchSamitiListScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Search Samiti List'),
      ),
    );
  }
}
