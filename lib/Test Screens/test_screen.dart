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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            centerTitle: true,
            floating: false,
            snap: false,
            pinned: true,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                size: 20.0,
              ),
            ),
            title: const Text('Hide on Scroll'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 20.0,
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size(size.width, kToolbarHeight * 1.06),
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    filled: true,
                    fillColor: Colors.white38,
                    hintStyle: const TextStyle(fontSize: 14.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
          ),
        ],
        body: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          itemExtent: 160,
          padding: const EdgeInsets.all(10.0),
          itemBuilder: (context, index) {
            return Card(
              color: Colors.deepPurple.shade200,
              child: Center(
                child: Text('data $index'),
              ),
            );
          },
        ),
      ),
    );
  }
}
