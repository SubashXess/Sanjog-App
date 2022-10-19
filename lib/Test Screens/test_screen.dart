import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            expandedHeight: kToolbarHeight * 2,
            automaticallyImplyLeading: false,
            collapsedHeight: kToolbarHeight * 1.2,
            backgroundColor: Colors.white,
            title: const Text(
              'Sanjog App',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_on,
                    size: 20.0,
                    color: Colors.black,
                  ))
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              expandedTitleScale: 1.0,
              title: SafeArea(
                child: SizedBox(
                  height: 46.0,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      filled: true,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      fillColor: Colors.grey.shade300,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              height: 300,
              color: Colors.blue,
              child: const Center(
                child: Text('center text'),
              ),
            ),
            Container(
              height: 300,
              color: Colors.blue,
              child: const Center(
                child: Text('center text'),
              ),
            ),
            Container(
              height: 300,
              color: Colors.blue,
              child: const Center(
                child: Text('center text'),
              ),
            ),
            Container(
              height: 300,
              color: Colors.blue,
              child: const Center(
                child: Text('center text'),
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
