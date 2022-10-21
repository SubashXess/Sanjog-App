import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            automaticallyImplyLeading: false,
            automaticallyImplyTitle: false,
            backgroundColor: Colors.deepPurple,
            largeTitle: Text('Search', style: TextStyle(color: Colors.white70)),
            padding: EdgeInsetsDirectional.zero,
            trailing: Icon(Icons.search),
            leading: Icon(Icons.arrow_back_ios),
            previousPageTitle: 'Add',
            middle: Text('data'),
            // middle: TextFormField(
            //   decoration: InputDecoration(
            //     hintText: 'Search',
            //     filled: true,
            //     fillColor: Colors.white38,
            //     isDense: true,
            //     border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(6.0),
            //         borderSide: BorderSide.none),
            //     enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(6.0),
            //         borderSide: BorderSide.none),
            //   ),
            // ),
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              itemExtent: 100,
              padding: const EdgeInsets.all(10.0),
              controller: _scrollController,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.deepPurple.shade200,
                  child: const Center(
                    child: Text('data'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
