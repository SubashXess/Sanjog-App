// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sonjagapp/Components/gradients.dart';
import 'package:sonjagapp/Components/or_divider.dart';
import 'package:sonjagapp/Components/showsnackbar.dart';
import 'package:sonjagapp/Constants/constants.dart';
import 'package:sonjagapp/Models/user_data_model.dart';
import 'package:sonjagapp/Screens/add_family_members_list_screen.dart';
import 'package:sonjagapp/Services/service.dart';
import 'package:sonjagapp/Widgets/button_widget.dart';
import 'package:sonjagapp/Widgets/textformfield_widget.dart';

class SearchFamilyMemberScreen extends StatefulWidget {
  const SearchFamilyMemberScreen({super.key});

  @override
  State<SearchFamilyMemberScreen> createState() =>
      _SearchFamilyMemberScreenState();
}

class _SearchFamilyMemberScreenState extends State<SearchFamilyMemberScreen> {
  // form validate global state
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey3 = GlobalKey<FormState>();

// ScrollController
  final ScrollController _scrollController = ScrollController();

  // TextEditingController
  final TextEditingController _voterNoController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _relationNameController = TextEditingController();
  final TextEditingController _aadharController = TextEditingController();

  // FocusNode
  late FocusNode _voterNoNode;
  late FocusNode _fNameNode;
  late FocusNode _lNameNode;
  late FocusNode _relNameNode;
  late FocusNode _aadharNoNode;

  // Models
  List<UserDataModel> _searchResultsItems = [];

  // Variables
  final bool _autovalidateMode = false;
  bool _isDataSearch = false;
  bool _isDataAvailable = false;
  Timer? debouncer;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _voterNoController.addListener(onListen);
    _aadharController.addListener(onListen);
    _firstNameController.addListener(onListen);
    _lastNameController.addListener(onListen);
    _relationNameController.addListener(onListen);
    _voterNoNode = FocusNode()..addListener(onListen);
    _fNameNode = FocusNode()..addListener(onListen);
    _lNameNode = FocusNode()..addListener(onListen);
    _relNameNode = FocusNode()..addListener(onListen);
    _aadharNoNode = FocusNode()..addListener(onListen);
  }

  @override
  void dispose() {
    _voterNoController.dispose();
    _voterNoController.removeListener(onListen);
    _aadharController.dispose();
    _aadharController.removeListener(onListen);
    _firstNameController.dispose();
    _firstNameController.removeListener(onListen);
    _lastNameController.dispose();
    _lastNameController.removeListener(onListen);
    _relationNameController.dispose();
    _relationNameController.removeListener(onListen);
    _voterNoNode.dispose();
    _voterNoNode.removeListener(onListen);
    _fNameNode.dispose();
    _fNameNode.removeListener(onListen);
    _lNameNode.dispose();
    _lNameNode.removeListener(onListen);
    _aadharNoNode.dispose();
    _aadharNoNode.removeListener(onListen);
    _relNameNode.dispose();
    _relNameNode.removeListener(onListen);
    super.dispose();
  }

  void onListen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leadingWidth: 36.0,
          titleSpacing: 0.0,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20.0,
            ),
          ),
          title: const Text(
            'Search Family Members',
            style: TextStyle(
              color: Colors.white,
              fontSize: Constants.fontLarge,
              fontWeight: FontWeight.w600,
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                gradient: gradientColor(),
              ),
            ),
          ),
        ),
        body: !_isDataSearch
            ? SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            inputFormatters: const <TextInputFormatter>[
                              // UpperCaseTextFormatter(),
                              // FilteringTextInputFormatter.allow(
                              // RegExp("[0-9a-zA-Z]"))
                              // FilteringTextInputFormatter.allow(
                              //     RegExp(r'^[A-Za-z]{1,3}')),
                              // FilteringTextInputFormatter.allow(
                              //     RegExp(r'[0-9]{1,7}$')),
                            ],
                          ),
                        ),
                      ),
                      // const SizedBox(height: 5.0),
                      orDivider(
                          label: const Text('Or'),
                          borderColor: Colors.grey.shade400),
                      // const SizedBox(height: 5.0),
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
                          ),
                        ),
                      ),
                      // const SizedBox(height: 5.0),
                      orDivider(
                          label: const Text('Or'),
                          borderColor: Colors.grey.shade400),
                      // const SizedBox(height: 5.0),
                      SizedBox(
                        width: size.width,
                        child: Form(
                          key: _formKey3,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: FormFieldWidget(
                                      controller: _firstNameController,
                                      autovalidateMode: _autovalidateMode
                                          ? AutovalidateMode.onUserInteraction
                                          : AutovalidateMode.disabled,
                                      focusNode: _fNameNode,
                                      hintText: 'First name',
                                      isPrefixIcon: false,
                                      isSuffixIcon: false,
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Expanded(
                                    child: FormFieldWidget(
                                      controller: _lastNameController,
                                      autovalidateMode: _autovalidateMode
                                          ? AutovalidateMode.onUserInteraction
                                          : AutovalidateMode.disabled,
                                      focusNode: _lNameNode,
                                      hintText: 'Last name',
                                      isPrefixIcon: false,
                                      isSuffixIcon: false,
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              FormFieldWidget(
                                controller: _relationNameController,
                                autovalidateMode: _autovalidateMode
                                    ? AutovalidateMode.onUserInteraction
                                    : AutovalidateMode.disabled,
                                focusNode: _relNameNode,
                                hintText: 'Relation Name',
                                isPrefixIcon: false,
                                isSuffixIcon: false,
                                keyboardType: TextInputType.name,
                              ),
                              const SizedBox(height: 16.0),
                              MaterialButtonWidget(
                                size: size,
                                widget: const Text(
                                  'Search',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate() &&
                                      _voterNoController.text.isNotEmpty) {
                                    if (_voterNoController.text.length < 2) {
                                      showSnackBar(context,
                                          'Please enter valid voter id');
                                    } else {
                                      setState(() {
                                        _isDataSearch = true;
                                      });
                                      print('ok');
                                      searchVoterId(
                                          _voterNoController.text.trim());
                                    }

                                    print('voter');
                                  } else if (_formKey2.currentState!
                                          .validate() &&
                                      _aadharController.text.isNotEmpty) {
                                    if (_aadharController.text.length < 12) {
                                      showSnackBar(context,
                                          'Please enter valid Aadhar Number');
                                    } else {
                                      setState(() {
                                        _isDataSearch = !_isDataSearch;
                                      });
                                    }

                                    print('aadhar');
                                  } else if (_formKey3.currentState!
                                          .validate() &&
                                      _firstNameController.text.isNotEmpty) {
                                    setState(() {
                                      _isDataSearch = true;
                                    });
                                    print('fname');
                                  } else {
                                    print('Error');
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Future searchVoterId(String query) async => debounce(() async {
        final searchResult =
            await APIServices.getUserByVoterID(context, voterId: query);
        if (!mounted) return;
        setState(() {
          searchQuery = query;
          _searchResultsItems = searchResult!;
        });
      });

  void debounce(VoidCallback callback,
      {Duration duration = const Duration(milliseconds: 1000)}) {
    if (debouncer != null) {
      debouncer!.cancel();
    }
    debouncer = Timer(duration, callback);
  }

  Widget _buildVoterList(Size size) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return SizedBox(
          width: size.width,
          child: Card(
            margin: EdgeInsets.zero,
            color: Colors.grey.shade200,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0)),
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100.0,
                        width: 100.0,
                        child: Card(
                          margin: EdgeInsets.zero,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                          color: Colors.grey.shade400,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: const Center(
                            child: Text('Image'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Saroj Das',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: Constants.fontLarge,
                              ),
                            ),
                            const SizedBox(height: 6.0),
                            _buildRowItems(
                                label: 'DOB:', labelData: '10-03-2000'),
                            const SizedBox(height: 6.0),
                            _buildRowItems(
                                label: 'Voter ID:', labelData: 'OXP1234567'),
                            const SizedBox(height: 6.0),
                            _buildRowItems(
                                label: 'Aadhar No',
                                labelData: '1234 5678 4534'),
                            const SizedBox(height: 6.0),
                            _buildRowItems(
                                label: 'Mobile No',
                                labelData: '+91 1234567890'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
}

// class UpperCaseTextFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     return newValue.copyWith(text: newValue.text.toUpperCase());
//   }
// }
