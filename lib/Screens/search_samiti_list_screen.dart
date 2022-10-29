// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sonjagapp/Constants/constants.dart';
import 'package:sonjagapp/Error%20Screens/no_data_found.dart';
import 'package:sonjagapp/Models/user_data_model.dart';
import 'package:sonjagapp/Services/service.dart';

class SearchSamitiListScreen extends StatefulWidget {
  const SearchSamitiListScreen({super.key});

  @override
  State<SearchSamitiListScreen> createState() => _SearchSamitiListScreenState();
}

class _SearchSamitiListScreenState extends State<SearchSamitiListScreen> {
  // ScrollController
  final ScrollController _scrollController = ScrollController();

  // TextEditingController
  final TextEditingController _boothController = TextEditingController();

  // FocusNode
  late FocusNode _boothNode;

  // models
  List<UserDataModel> _searchResultsItems = [];

// Variables
  bool _autovalidateMode = false;
  Timer? debouncer;
  String searchQuery = '';
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _boothNode = FocusNode()..addListener(onListen);
    _boothController.addListener(onListen);
  }

  @override
  void dispose() {
    _boothNode.removeListener(onListen);
    _boothNode.dispose();
    _boothController.removeListener(onListen);
    _boothController.dispose();
    super.dispose();
  }

  void onListen() {
    setState(() {});
  }

  void debounce(VoidCallback callback,
      {Duration duration = const Duration(milliseconds: 1000)}) {
    if (debouncer != null) {
      debouncer!.cancel();
    }
    debouncer = Timer(duration, callback);
  }

  Future searchSamitiList(String query) async => debounce(() async {
        final searchResult = await APIServices.getPageSamitiSearchResult(
            context,
            boothNo: query);
        if (!mounted) return;
        setState(() {
          searchQuery = query;
          _searchResultsItems = searchResult!;
        });

        print('Result : ${_searchResultsItems.length}');
      });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              centerTitle: true,
              // expandedHeight: kToolbarHeight * ,
              backgroundColor: Constants.kPrimaryThemeColor,
              toolbarHeight: kToolbarHeight * 0.8,
              titleSpacing: 0.0,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: const Text(
                'Search Samiti List',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Constants.fontLarge,
                  fontWeight: FontWeight.w600,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight + 4.0),
                child: Container(
                  width: size.width,
                  height: 40.0,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Colors.white38,
                          margin: EdgeInsets.zero,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0)),
                          child: const Center(
                            child: Text(
                              'ଏକାମ୍ର ଭୁବନେଶ୍ବର',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Constants.fontRegular,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: TextFormField(
                          controller: _boothController,
                          maxLines: 1,
                          focusNode: _boothNode,
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          decoration: InputDecoration(
                            hintText: 'Booth No',
                            filled: true,
                            counterText: '',
                            fillColor: _boothNode.hasFocus
                                ? Colors.white60
                                : Colors.white38,
                            // isDense: true,
                            suffixIcon: _boothController.text.isEmpty
                                ? Container(width: 0.0)
                                : IconButton(
                                    onPressed: () => setState(
                                        () => _boothController.clear()),
                                    icon: const Icon(
                                      Icons.clear,
                                      size: 20.0,
                                      color: Colors.white70,
                                    ),
                                  ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            hintStyle: const TextStyle(
                                color: Colors.white70,
                                fontSize: Constants.fontSmall,
                                fontWeight: FontWeight.w500),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide.none),
                          ),
                          onChanged: searchSamitiList,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _searchResultsItems.isNotEmpty
                ? SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 10.0, right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Total Records:',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: Constants.fontMedium,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Text(
                                    _searchResultsItems.length.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: Constants.fontMedium,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Designation Instructions',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Constants.fontRegular,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Card(
                                    elevation: 0.0,
                                    margin: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0)),
                                    color: Colors.red.shade300,
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6.0, vertical: 4.0),
                                      child: Text(
                                        'PP',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: Constants.fontSmall),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Card(
                                    elevation: 0.0,
                                    margin: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0)),
                                    color: Colors.green.shade300,
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6.0, vertical: 4.0),
                                      child: Text(
                                        'PC',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: Constants.fontSmall),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Card(
                                    elevation: 0.0,
                                    margin: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        side: BorderSide(
                                            width: 1.0,
                                            color: Colors.grey.shade400)),
                                    color: Colors.white,
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6.0, vertical: 4.0),
                                      child: Text(
                                        'NA',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: Constants.fontSmall),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: _searchResultsItems.length,
                            controller: _scrollController,
                            padding: const EdgeInsets.all(10.0),
                            itemBuilder: (context, index) {
                              print(_searchResultsItems.length);
                              return _buildCard(
                                  size, index + 1, _searchResultsItems[index]);
                            }),
                      ],
                    ),
                  )
                : const SliverFillRemaining(
                    fillOverscroll: false,
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        'Search by Booth number',
                        style: TextStyle(fontSize: Constants.fontRegular),
                      ),
                    ),
                  ),
            // ErrorNoDataFound(
            //     btnlabel: 'Search samiti list',
            //     header: 'Search by booth number',
            //     desc: 'Search by entering booth no above',
            //     assets: 'assets/raw/search_id.json',
            //     btnicon: Icons.search,
            //     onPressed: () {
            //       _boothNode.requestFocus();
            //     },
            //   ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(Size size, int index, UserDataModel data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
          color: data.position == 'PP'
              ? Colors.red.withOpacity(0.06)
              : data.position == null
                  ? Colors.white
                  : Colors.green.withOpacity(0.06),
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
              width: 1.0,
              color: data.position == 'PP'
                  ? Colors.red
                  : data.position == null
                      ? Colors.white
                      : Colors.green)
          // boxShadow: const [
          //   BoxShadow(
          //     blurRadius: 4.0,
          //     spreadRadius: 1.0,
          //     color: Colors.black12,
          //     offset: Offset(0.0, 1.0),
          //   ),
          // ],
          ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardItems(
                label: 'Serial No:', labelData: index.toString(), data: data),
            const SizedBox(height: 6.0),
            _buildRowItems(
                label: 'Full Name:',
                labelData: '${data.fname} ${data.mname} ${data.lname}'),
            const SizedBox(height: 6.0),
            _buildRowItems(
                label: 'Mobile Number:', labelData: '+91 ${data.mobileNo}'),
            const SizedBox(height: 6.0),
            _buildRowItems(
                label: 'Voter ID:',
                labelData: data.voterNo!.toUpperCase().toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildCardItems(
      {required String label,
      required String labelData,
      required UserDataModel data}) {
    return Container(
      // constraints: BoxConstraints(maxWidth: size.width * 0.6, minWidth: 100.0),
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: data.position == 'PP'
              ? Colors.red.shade100
              : data.position == null
                  ? Colors.white60
                  : Colors.green.shade100),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: Constants.fontSmall,
            ),
          ),
          const SizedBox(width: 4.0),
          Text(
            labelData.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: Constants.fontSmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRowItems({required String label, required String labelData}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label.toString(),
          style: const TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w500,
            fontSize: Constants.fontRegular,
          ),
        ),
        const SizedBox(width: 6.0),
        Expanded(
          child: Text(
            labelData.toString(),
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: Constants.fontRegular,
            ),
          ),
        ),
      ],
    );
  }
}
