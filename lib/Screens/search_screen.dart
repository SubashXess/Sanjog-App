import 'package:flutter/material.dart';
import 'package:sonjagapp/Widgets/textformfield_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Seach'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.012),
                // TextFormFieldWidget(
                //   size: size,
                //   controller: _searchController,
                //   hintText: 'Search',
                //   textInputType: TextInputType.text,
                //   onChanged: (value) {},
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
