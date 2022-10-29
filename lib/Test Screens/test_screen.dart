// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sonjagapp/Error%20Screens/no_data_found.dart';
import 'package:sonjagapp/Models/user_data_model.dart';
import 'package:sonjagapp/Providers/voter_list_provider.dart';
import 'package:sonjagapp/Screens/well_wisher_target_screen.dart';
import 'package:sonjagapp/Test%20Screens/test_provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Provider.of<TestProvider>(context, listen: false)
        .getVoterData(context, '4');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    print('Rebuild');
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const WellWisherTargetScreen()));
                },
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
        body: Consumer<TestProvider>(builder: (context, value, child) {
          if (!value.hasNodata) {
            print('No data');
            if (value.data.isNotEmpty) {
              final items = value.data;
              print('has data');
              return ListView.builder(
                itemCount: items.length,
                shrinkWrap: true,
                itemExtent: 160,
                padding: const EdgeInsets.all(10.0),
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.deepPurple.shade200,
                    child: Center(
                      child: Text(items[index].fname.toString()),
                    ),
                  );
                },
              );
            } else {
              print('Circular indicator detect');
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          } else {
            return ErrorNoDataFound(
              btnlabel: 'Go back',
              header: 'No Data Found',
              desc: 'We can\'t find any item matching\nyour search.',
              assets: 'assets/raw/nodata.json',
              btnicon: Icons.arrow_back_rounded,
              onPressed: () => Navigator.pop(context),
            );
          }
        }),
      ),
    );
  }
}
