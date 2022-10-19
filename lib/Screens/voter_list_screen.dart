// ignore_for_file: avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/long_press.dart';
import 'package:sonjagapp/Constants/constants.dart';
import 'package:sonjagapp/Error%20Screens/no_data_found.dart';
import 'package:sonjagapp/Models/user_data_model.dart';
import 'package:sonjagapp/Services/service.dart';

class VoterListScreen extends StatefulWidget {
  const VoterListScreen({super.key, required this.boothNo, this.pageNo});

  final String boothNo;
  final String? pageNo;

  @override
  State<VoterListScreen> createState() => _VoterListScreenState();
}

class _VoterListScreenState extends State<VoterListScreen> {
// AnimationController

// ScrollController
  final ScrollController _scrollController = ScrollController();

  // models
  List<UserDataModel> voterItems = [];

  // Variables
  bool _isLoaded = false;
  int page = 1;
  bool _hasNoData = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        ++page;
        getVoterItems();
      }
    });
    getVoterItems();
  }

  getVoterItems() async {
    voterItems =
        (await APIServices.getVoterList(boothNo: widget.boothNo, context))!;
    if (voterItems.isNotEmpty) {
      setState(() {
        _hasNoData = false;
        _isLoaded = true;
      });
    } else {
      setState(() {
        _isLoaded = false;
        _hasNoData = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          elevation: 1.0,
          title: const Text(
            'Voter List',
            style: TextStyle(
              color: Colors.white,
              fontSize: Constants.fontLarge,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 20.0,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Constants.kPrimaryThemeColor,
                    Color(0xFFF97D09)
                  ], // Color(0xFFF97D09)
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 20.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: _isLoaded
            ? SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10.0, left: 10.0, top: 16.0, bottom: 6.0),
                      child: Column(
                        children: [
                          ListView.builder(
                            itemCount: voterItems.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            controller: _scrollController,
                            itemBuilder: (context, index) {
                              return _buildVoterCard(size, voterItems[index]);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : !_hasNoData
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const ErrorNoDataFound(),
      ),
    );
  }

  Widget _buildVoterCard(Size size, UserDataModel data) {
    return Container(
      width: size.width,
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8.0,
            spreadRadius: 1.0,
            color: Colors.black12,
            offset: Offset(0.0, 2.0),
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
                constraints:
                    const BoxConstraints(minWidth: 100.0, maxWidth: 100.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Constants.kSecondaryThemeColor.withOpacity(0.8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Ac No:',
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        fontSize: Constants.fontRegular,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      data.acNo.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: Constants.fontRegular,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  print('Edit');
                },
                child: Container(
                  constraints: const BoxConstraints(minWidth: 100.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: Constants.kLightThemeColor,
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                        width: 1.0,
                        color: Constants.kPrimaryThemeColor.withOpacity(0.4)),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.edit,
                        size: 16,
                        color: Constants.kPrimaryThemeColor,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        'Edit Details',
                        style: TextStyle(
                            color: Constants.kPrimaryThemeColor,
                            fontWeight: FontWeight.w500,
                            fontSize: Constants.fontSmall),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10.0),
          Wrap(
            runSpacing: 10.0,
            spacing: 10.0,
            children: [
              data.boothNo == null || data.boothNo == '0'
                  ? const SizedBox(width: 0.0)
                  : _buildCardItems(
                      label: 'Booth No:', labelData: data.boothNo.toString()),
              data.pageNo == null || data.pageNo == '0'
                  ? const SizedBox(width: 0.0)
                  : _buildCardItems(
                      label: 'Page No:', labelData: data.pageNo.toString()),
              data.serialNo == null || data.serialNo == '0'
                  ? const SizedBox(width: 0.0)
                  : _buildCardItems(
                      label: 'Serial No:', labelData: data.serialNo.toString()),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      print('Change photo');
                    },
                    child: Card(
                      margin: EdgeInsets.zero,
                      color: Colors.grey.shade200,
                      elevation: 0.0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      child: data.photo == null
                          ? Icon(
                              Icons.person_rounded,
                              color: Colors.grey.shade400,
                              size: 46.0,
                            )
                          : CachedNetworkImage(
                              imageUrl: data.photo.toString(),
                              fit: BoxFit.contain,
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.fontLarge,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    _buildRowItems(
                        label: 'DOB:',
                        labelData: data.dob == null ? '' : data.dob.toString()),
                    const SizedBox(height: 4.0),
                    _buildRowItems(
                        label: 'Sex:',
                        labelData:
                            data.gender == null ? '' : data.gender.toString()),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        Text(
                          data.voterNo.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Constants.fontRegular,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        data.position == null
                            ? const SizedBox(width: 0.0)
                            : Card(
                                margin: EdgeInsets.zero,
                                elevation: 0.0,
                                color: Constants.kSecondaryThemeColor
                                    .withOpacity(0.8),
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
                                      fontSize: Constants.fontSmall,
                                    ),
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
                  'Address',
                  style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                    fontSize: Constants.fontRegular,
                  ),
                ),
                data.address == null
                    ? const SizedBox(height: 0.0)
                    : const SizedBox(height: 4.0),
                data.address == null
                    ? const Text('')
                    : Text(
                        data.address.toString(),
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: Constants.fontRegular,
                        ),
                      ),
                data.address == null
                    ? const SizedBox(height: 0.0)
                    : const SizedBox(height: 6.0),
                Wrap(
                  alignment: WrapAlignment.start,
                  runSpacing: 10.0,
                  spacing: 10.0,
                  children: [
                    _buildItems(
                        label: 'Category:',
                        labelData: data.category == null
                            ? ''
                            : data.category.toString()),
                    _buildItems(
                        label: 'Relation Type:',
                        labelData: data.relationType == null
                            ? ''
                            : data.relationType.toString()),
                    _buildItems(
                        label: 'Relation Name:',
                        labelData: data.relationName == null
                            ? ''
                            : data.relationName.toString()),
                    _buildItems(
                        label: 'Mobile No:',
                        labelData: data.mobileNo == null
                            ? ''
                            : '+91 ${data.mobileNo.toString()}'),
                    _buildItems(
                        label: 'Whatsapp No:',
                        labelData: data.whatsappNo == null
                            ? ''
                            : '+91 ${data.whatsappNo.toString()}'),
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
                  onPressed: () {},
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
                  bgColor: Colors.grey.shade200,
                  textColor: Colors.black54,
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
