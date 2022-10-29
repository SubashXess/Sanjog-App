// ignore_for_file: avoid_print

import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sonjagapp/Components/or_divider.dart';
import 'package:sonjagapp/Constants/constants.dart';
import 'package:sonjagapp/Error%20Screens/no_data_found.dart';
import 'package:sonjagapp/Error%20Screens/no_internet_connection.dart';
import 'package:sonjagapp/Models/user_data_model.dart';
import 'package:sonjagapp/Providers/connection_provider.dart';
import 'package:sonjagapp/Providers/edit_voters_provider.dart';
import 'package:sonjagapp/Screens/search_family_members.dart';
import 'package:sonjagapp/Screens/edit_voter_details.dart';
import 'package:sonjagapp/Services/service.dart';
import 'package:sonjagapp/Widgets/button_widget.dart';
import 'package:sonjagapp/Widgets/text_button_widget.dart';
import 'package:sonjagapp/Widgets/textformfield_widget.dart';

class VoterListScreen extends StatefulWidget {
  const VoterListScreen({super.key, required this.boothNo, this.pageNo});

  final String boothNo;
  final String? pageNo;

  @override
  State<VoterListScreen> createState() => _VoterListScreenState();
}

class _VoterListScreenState extends State<VoterListScreen> {
  // form validate global state
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey3 = GlobalKey<FormState>();

// AnimationController

// ScrollController
  final ScrollController _scrollController = ScrollController();

  // TextEditingController
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _voterNoController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _relationNameController = TextEditingController();
  final TextEditingController _aadharController = TextEditingController();

  // FocusNode
  late FocusNode _searchFocusNode;
  late FocusNode _voterNoNode;
  late FocusNode _nameNode;
  late FocusNode _relNameNode;
  late FocusNode _aadharNoNode;

  // models
  List<UserDataModel> voterItems = [];
  List<UserDataModel> _searchResultsItems = [];

  // Variables
  int page = 1;
  String searchQuery = '';
  Timer? debouncer;
  final bool _autovalidateMode = false;

  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
    init();
    _searchFocusNode = FocusNode()..addListener(onListen);
    _scrollController.addListener(onListen);
    _voterNoController.addListener(onListen);
    _aadharController.addListener(onListen);
    _nameController.addListener(onListen);
    _relationNameController.addListener(onListen);
    _voterNoNode = FocusNode()..addListener(onListen);
    _nameNode = FocusNode()..addListener(onListen);
    _relNameNode = FocusNode()..addListener(onListen);
    _aadharNoNode = FocusNode()..addListener(onListen);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(onListen);
    _searchController.dispose();
    _searchController.removeListener(onListen);
    _searchFocusNode.dispose();
    _searchFocusNode.removeListener(onListen);
    debouncer?.cancel();
    _voterNoController.dispose();
    _voterNoController.removeListener(onListen);
    _aadharController.dispose();
    _aadharController.removeListener(onListen);
    _nameController.dispose();
    _nameController.removeListener(onListen);
    _relationNameController.dispose();
    _relationNameController.removeListener(onListen);
    _voterNoNode.dispose();
    _voterNoNode.removeListener(onListen);
    _nameNode.dispose();
    _nameNode.removeListener(onListen);
    _aadharNoNode.dispose();
    _aadharNoNode.removeListener(onListen);
    _relNameNode.dispose();
    _relNameNode.removeListener(onListen);
    super.dispose();
  }

  void onListen() {
    setState(() {});
  }

  Future<List<UserDataModel>> init() async {
    return voterItems = (await APIServices.getVoterList(
            boothNo: widget.boothNo, context, name: ''))!
        .where((element) {
      final lowerBoothNo = element.boothNo!.trim().toLowerCase().toString();
      final filterData = widget.boothNo.trim().toLowerCase().toString();
      return lowerBoothNo.contains(filterData);
    }).toList();
  }

  void debounce(VoidCallback callback,
      {Duration duration = const Duration(milliseconds: 1000)}) {
    if (debouncer != null) {
      debouncer!.cancel();
    }
    debouncer = Timer(duration, callback);
    // voterItems = [];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: Consumer<ConnectivityProvider>(builder: (context, value, child) {
          if (value.isOnline != null) {
            return value.isOnline!
                ? FutureBuilder<List<UserDataModel>>(
                    future: init(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.isNotEmpty) {
                          return CustomScrollView(
                            shrinkWrap: true,
                            slivers: [
                              SliverAppBar(
                                backgroundColor: Constants.kPrimaryThemeColor,
                                floating: true,
                                pinned: true,
                                snap: false,
                                centerTitle: true,
                                automaticallyImplyLeading: false,
                                elevation: 0.0,
                                toolbarHeight: kToolbarHeight * 0.8,
                                leading: IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                                title: const Text(
                                  'Voter List',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Constants.fontLarge,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                bottom: AppBar(
                                  automaticallyImplyLeading: false,
                                  titleSpacing: 0.0,
                                  leadingWidth: 0.0,
                                  elevation: 0.0,
                                  backgroundColor: Constants.kPrimaryThemeColor,
                                  title: Container(
                                    width: size.width,
                                    height: 40.0,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: TextFormField(
                                      controller: _searchController,
                                      maxLines: 1,
                                      focusNode: _searchFocusNode,
                                      decoration: InputDecoration(
                                        hintText: 'Search by name',
                                        filled: true,
                                        fillColor: _searchFocusNode.hasFocus
                                            ? Colors.white60
                                            : Colors.white24,
                                        isDense: true,
                                        prefixIcon: const Icon(
                                          Icons.search_rounded,
                                          size: 20.0,
                                          color: Colors.white70,
                                        ),
                                        suffixIcon: _searchController
                                                .text.isEmpty
                                            ? Container(width: 0.0)
                                            : IconButton(
                                                onPressed: () => setState(() =>
                                                    _searchController.clear()),
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
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            borderSide: BorderSide.none),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            borderSide: BorderSide.none),
                                      ),
                                      onChanged: searchVoterId,
                                    ),
                                  ),
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10.0,
                                          left: 10.0,
                                          top: 10.0,
                                          bottom: 0.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              _buildItems(
                                                  label: 'Booth No:',
                                                  labelData: widget.boothNo),
                                              const SizedBox(width: 10.0),
                                              _buildItems(
                                                  label: 'Total Voters:',
                                                  labelData: voterItems.length
                                                      .toString()),
                                            ],
                                          ),
                                          const SizedBox(height: 10.0),
                                          ListView.builder(
                                            itemCount: _searchController
                                                    .text.isEmpty
                                                ? voterItems.length
                                                : _searchResultsItems.length,
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            controller: _scrollController,
                                            itemBuilder: (context, index) {
                                              if (_searchResultsItems.isEmpty ||
                                                  _searchController
                                                      .text.isEmpty) {
                                                return _buildVoterCard(
                                                    size,
                                                    voterItems[index],
                                                    snapshot);
                                              } else {
                                                print(
                                                    _searchResultsItems.length);
                                                return _buildVoterCard(
                                                    size,
                                                    _searchResultsItems[index],
                                                    snapshot);
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          print('error');
                          return ErrorNoDataFound(
                            btnlabel: 'Go back',
                            header: 'No Data Found',
                            desc:
                                'We can\'t find any item matching\nyour search.',
                            assets: 'assets/raw/nodata.json',
                            btnicon: Icons.arrow_back_rounded,
                            onPressed: () => Navigator.pop(context),
                          );
                        }
                      } else {
                        print('load data');
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })
                : const NoInternetConnectionError();
          } else {
            print('load network');
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }

  Widget _buildVoterCard(Size size, UserDataModel data,
      AsyncSnapshot<List<UserDataModel>> snapshot) {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
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
                        boothNo: widget.boothNo,
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
          // const SizedBox(height: 10.0),
          // Wrap(
          //   runSpacing: 10.0,
          //   spacing: 10.0,
          //   children: [
          //     data.boothNo == null || data.boothNo == '0'
          //         ? const SizedBox(width: 0.0)
          //         : _buildCardItems(
          //             label: 'Booth No:', labelData: data.boothNo.toString()),
          //     data.pageNo == null || data.pageNo == '0'
          //         ? const SizedBox(width: 0.0)
          //         : _buildCardItems(
          //             label: 'Page No:', labelData: data.pageNo.toString()),
          //     data.serialNo == null || data.serialNo == '0'
          //         ? const SizedBox(width: 0.0)
          //         : _buildCardItems(
          //             label: 'Serial No:', labelData: data.serialNo.toString()),
          //   ],
          // ),
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
                    Row(
                      children: [
                        Text(
                          '${data.fname} ${data.mname} ${data.lname}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Constants.fontMedium,
                          ),
                        ),
                      ],
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
            fontSize: Constants.fontSmall,
          ),
        ),
        const SizedBox(width: 6.0),
        Expanded(
          child: Text(
            labelData.toString(),
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: Constants.fontSmall,
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
            fontSize: Constants.fontSmall,
          ),
        ),
        const SizedBox(width: 6.0),
        Text(
          labelData.toString(),
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: Constants.fontSmall,
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
            fontWeight: FontWeight.w600,
          ),
        ),
        visualDensity: const VisualDensity(horizontal: -4, vertical: -1),
      ),
      child: Text(label.toString()),
    );
  }

  Future _draggableScrollableSheet(context) {
    Size size = MediaQuery.of(context).size;
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      // useSafeArea: true,
      isScrollControlled: true, // set this to true
      builder: (context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Card(
              color: Colors.white,
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(6.0))),
              child: ListView(
                shrinkWrap: true,
                controller: _scrollController,
                padding: EdgeInsets.only(
                    top: 10.0,
                    right: 10.0,
                    left: 10.0,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 10.0),
                children: [
                  SizedBox(
                    width: size.width,
                    child: const Text(
                      'Search Family Members',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Constants.fontLarge,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: size.width,
                    child: Form(
                      key: _formKey,
                      child: FormFieldWidget(
                        controller: _voterNoController,
                        autovalidateMode: _autovalidateMode
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        focusNode: _voterNoNode,
                        hintText: 'Search by Voter ID',
                        isPrefixIcon: false,
                        isSuffixIcon: false,
                        // maxLength: 10,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.characters,
                        inputFormatters: <TextInputFormatter>[
                          // UpperCaseTextFormatter(),
                          // FilteringTextInputFormatter.allow(
                          // RegExp("[0-9a-zA-Z]"))
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^[A-Za-z]{1,3}')),
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9]{1,7}$')),
                        ],
                        onChanged: (value) {
                          print(value);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  orDivider(
                      label: const Text('Or'),
                      borderColor: Colors.grey.shade400),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: size.width,
                    child: Form(
                      key: _formKey2,
                      child: FormFieldWidget(
                        controller: _aadharController,
                        autovalidateMode: _autovalidateMode
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        focusNode: _aadharNoNode,
                        hintText: 'Search by Aadhar Number',
                        isPrefixIcon: false,
                        isSuffixIcon: false,
                        maxLength: 12,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  orDivider(
                      label: const Text('Or'),
                      borderColor: Colors.grey.shade400),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: size.width,
                    child: Form(
                      key: _formKey3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: FormFieldWidget(
                              controller: _nameController,
                              autovalidateMode: _autovalidateMode
                                  ? AutovalidateMode.onUserInteraction
                                  : AutovalidateMode.disabled,
                              focusNode: _nameNode,
                              hintText: 'Name',
                              isPrefixIcon: false,
                              isSuffixIcon: false,
                              keyboardType: TextInputType.name,
                              onChanged: (value) {},
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: FormFieldWidget(
                              controller: _relationNameController,
                              autovalidateMode: _autovalidateMode
                                  ? AutovalidateMode.onUserInteraction
                                  : AutovalidateMode.disabled,
                              focusNode: _relNameNode,
                              hintText: 'Relation Name',
                              isPrefixIcon: false,
                              isSuffixIcon: false,
                              keyboardType: TextInputType.name,
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  MaterialButtonWidget(
                    size: size,
                    widget: const Text(
                      'Search',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate() ||
                          _formKey2.currentState!.validate() ||
                          _formKey3.currentState!.validate()) {
                        print('Success');
                      } else {
                        print('Error');
                      }
                    },
                  ),
                ],
              )),
        );
      },
    );
  }

  Future searchVoterId(String query) async => debounce(() async {
        final searchResult = await APIServices.getVoterList(context,
            boothNo: widget.boothNo, name: query);
        if (!mounted) return;
        setState(() {
          searchQuery = query;
          _searchResultsItems = searchResult!;
        });
      });
}
