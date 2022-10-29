// ignore_for_file: avoid_print

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sonjagapp/Constants/constants.dart';
import 'package:sonjagapp/Error%20Screens/no_data_found.dart';
import 'package:sonjagapp/Models/user_data_model.dart';
import 'package:sonjagapp/Services/service.dart';
import 'package:sonjagapp/Widgets/textformfield_widget.dart';

import 'edit_voter_details.dart';
import 'search_family_members.dart';

class SearchByVoterIdScreen extends StatefulWidget {
  const SearchByVoterIdScreen({super.key});

  @override
  State<SearchByVoterIdScreen> createState() => _SearchByVoterIdScreenState();
}

class _SearchByVoterIdScreenState extends State<SearchByVoterIdScreen> {
  // ScrollController
  final ScrollController _scrollController = ScrollController();

  // TextEditingController
  final TextEditingController _voterIdController = TextEditingController();

  // FocusNode
  late FocusNode _voterIdNode;

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
    _voterIdNode = FocusNode()..addListener(onListen);
    _voterIdController.addListener(onListen);
  }

  @override
  void dispose() {
    _voterIdNode.removeListener(onListen);
    _voterIdNode.dispose();
    _voterIdController.removeListener(onListen);
    _voterIdController.dispose();
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
    _searchResultsItems = [];
  }

  Future searchVoterId(String query) async => debounce(() async {
        final searchResult =
            await APIServices.getVoterIdSearchResult(context, voterId: query);

        if (!mounted) return;
        setState(() {
          searchQuery = query;
          _searchResultsItems = searchResult!;
        });
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
                'Search by Voter ID',
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
                  child: TextFormField(
                    controller: _voterIdController,
                    maxLines: 1,
                    focusNode: _voterIdNode,
                    decoration: InputDecoration(
                      hintText: 'Search by Voter ID',
                      filled: true,
                      fillColor: _voterIdNode.hasFocus
                          ? Colors.white60
                          : Colors.white24,
                      isDense: true,
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        size: 20.0,
                        color: Colors.white70,
                      ),
                      suffixIcon: _voterIdController.text.isEmpty
                          ? Container(width: 0.0)
                          : IconButton(
                              onPressed: () =>
                                  setState(() => _voterIdController.clear()),
                              icon: const Icon(
                                Icons.clear,
                                size: 20.0,
                                color: Colors.white70,
                              ),
                            ),
                      contentPadding: EdgeInsets.zero,
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
                    onChanged: searchVoterId,
                  ),
                ),
              ),
            ),
            _voterIdController.text.isNotEmpty
                ? _searchResultsItems.isNotEmpty
                    ? SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListView.builder(
                            itemCount: _searchResultsItems.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            controller: _scrollController,
                            itemBuilder: (context, index) {
                              print(_searchResultsItems.length);
                              return _buildVoterCard(
                                  size, _searchResultsItems[index], index + 1);
                            },
                          ),
                        ),
                      )
                    : SliverFillRemaining(
                        fillOverscroll: false,
                        hasScrollBody: false,
                        child: Center(
                          child: const CircularProgressIndicator(),
                        ),
                      )
                : SliverFillRemaining(
                    fillOverscroll: false,
                    hasScrollBody: false,
                    child: Center(
                      child: Text('Search by Voter ID'),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  // ErrorNoDataFound(
  //                     btnlabel: 'Search voter id',
  //                     header: 'Search by Voter Id',
  //                     desc: 'Search by entering voter id above',
  //                     assets: 'assets/raw/search_id.json',
  //                     btnicon: Icons.search,
  //                     onPressed: () {
  //                       _voterIdNode.requestFocus();
  //                     },
  //                   ),

  Widget _buildVoterCard(Size size, UserDataModel data, int index) {
    return Container(
      width: size.width,
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: const [
          BoxShadow(
            blurRadius: 6.0,
            spreadRadius: 0.0,
            color: Colors.black12,
            offset: Offset(0.0, 1.0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Serial No:',
                    style: TextStyle(
                      color: Constants.kPrimaryThemeColor.withAlpha(120),
                      fontSize: Constants.fontExtraSmall,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    '$index',
                    style: const TextStyle(
                      color: Constants.kPrimaryThemeColor,
                      fontSize: Constants.fontExtraSmall,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10.0),
              TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 0.0)),
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditDetailsScreen(
                        voterId: data.voterNo.toString(),
                        acNo: data.acNo.toString(),
                        boothNo: '',
                        details: data,
                        id: data.id.toString(),
                      ),
                    ),
                  ).then((value) => setState(() {}));
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    color: Constants.kPrimaryThemeColor,
                    fontSize: Constants.fontExtraSmall,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                constraints: const BoxConstraints(minWidth: 100.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.grey.shade200,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Ac No:',
                      style: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w500,
                        fontSize: Constants.fontExtraSmall,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      data.acNo.toString(),
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.fontExtraSmall,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10.0),
              data.boothNo == null || data.boothNo == '0'
                  ? const SizedBox(width: 0.0)
                  : _buildCardItems(
                      label: 'Booth No:', labelData: data.boothNo.toString()),
              // data.pageNo == null || data.pageNo == '0'
              //     ? const SizedBox(width: 0.0)
              //     : _buildCardItems(
              //         label: 'Page No:', labelData: data.pageNo.toString()),
              // data.serialNo == null || data.serialNo == '0'
              //     ? const SizedBox(width: 0.0)
              //     : _buildCardItems(
              //         label: 'Serial No:', labelData: data.serialNo.toString()),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: Card(
                  margin: EdgeInsets.zero,
                  color: Colors.grey.shade200,
                  elevation: 0.0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  child: data.photo!.isEmpty
                      ? Icon(
                          Icons.person_rounded,
                          size: 46.0,
                          color: Colors.grey.shade400,
                        )
                      : CachedNetworkImage(
                          imageUrl: data.photo.toString(),
                          fit: BoxFit.contain,
                        ),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // data.name.toString(),
                      '${data.fname} ${data.mname} ${data.lname}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.fontMedium,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    _buildRowItems(
                        label: 'DOB:', labelData: data.dob.toString()),
                    const SizedBox(height: 4.0),
                    _buildRowItems(
                        label: 'Gender:', labelData: data.gender.toString()),
                    const SizedBox(height: 4.0),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.start,
                      children: [
                        const Text(
                          'Voter No:',
                          style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w500,
                            fontSize: Constants.fontSmall,
                          ),
                        ),
                        const SizedBox(width: 6.0),
                        Text(
                          data.voterNo.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Constants.fontSmall,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        data.position! == 'null' || data.position! == 'None'
                            ? const SizedBox(width: 0.0)
                            : Card(
                                margin: EdgeInsets.zero,
                                elevation: 0.0,
                                color: data.position == 'PP'
                                    ? Constants.kSecondaryThemeColor
                                        .withOpacity(0.8)
                                    : Colors.green.shade300,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.0)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6.0, vertical: 2.0),
                                  child: Text(
                                    data.position.toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Constants.fontExtraSmall,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Aadhar No:',
                          style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w500,
                            fontSize: Constants.fontSmall,
                          ),
                        ),
                        const SizedBox(width: 6.0),
                        Expanded(
                          child: Text(
                            data.adharNo.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Constants.fontSmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          const Divider(height: 0.0),
          const SizedBox(height: 10.0),
          SizedBox(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Address:',
                  style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                    fontSize: Constants.fontSmall,
                  ),
                ),
                data.address.isEmpty
                    ? const SizedBox(height: 0.0)
                    : const SizedBox(height: 4.0),
                Text(
                  data.address.toString(),
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: Constants.fontSmall,
                  ),
                ),
                data.address.isEmpty
                    ? const SizedBox(height: 0.0)
                    : const SizedBox(height: 10.0),
                Wrap(
                  alignment: WrapAlignment.start,
                  runSpacing: 10.0,
                  spacing: 10.0,
                  children: [
                    _buildItems(
                        label: 'Category:',
                        labelData: data.category! != 'null'
                            ? data.category.toString()
                            : ''),
                    _buildItems(
                        label: 'Relation Type:',
                        labelData: data.relationType.toString()),
                    _buildItems(
                        label: 'Relation Name:',
                        labelData: data.relationName.toString()),
                    _buildItems(
                        label: 'Mobile No:',
                        labelData: '+91 ${data.mobileNo.toString()}'),
                    _buildItems(
                        label: 'Whatsapp No:',
                        labelData: '+91 ${data.whatsappNo.toString()}'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                child: _buildTextButtonWidget(
                  // onPressed: () => _draggableScrollableSheet(context),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const SearchFamilyMemberScreen())),
                  label: 'Add Family Members',
                  bgColor: Constants.kLightThemeColor,
                  textColor: Constants.kSecondaryThemeColor,
                  overlayColor: Constants.kPrimaryThemeColor.withOpacity(0.16),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: _buildTextButtonWidget(
                  onPressed: () {},
                  label: 'See Family Details',
                  bgColor: Colors.orange.withAlpha(40),
                  textColor: Colors.deepOrange.shade400,
                  overlayColor: Colors.grey.shade300,
                ),
              ),
            ],
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
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: Constants.fontRegular,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardItems({required String label, required String labelData}) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 100.0, minWidth: 100.0),
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.grey.shade200),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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

  Widget _buildItems({required String label, required String labelData}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
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
        Text(
          labelData.toString(),
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: Constants.fontRegular,
          ),
        ),
      ],
    );
  }

  Widget _buildTextButtonWidget({
    required VoidCallback onPressed,
    required String label,
    required Color bgColor,
    required Color textColor,
    required Color overlayColor,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        alignment: Alignment.center,
        elevation: MaterialStateProperty.all(0.0),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateProperty.all(overlayColor),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: MaterialStateProperty.all(bgColor),
        foregroundColor: MaterialStateProperty.all(textColor),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: Constants.fontSmall,
            fontWeight: FontWeight.w500,
          ),
        ),
        visualDensity: const VisualDensity(horizontal: -4, vertical: 0),
      ),
      child: Text(label.toString()),
    );
  }
}
