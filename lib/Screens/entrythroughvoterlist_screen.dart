// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sonjagapp/Components/showsnackbar.dart';
import 'package:sonjagapp/Screens/search_screen.dart';
import 'package:sonjagapp/Screens/voter_details_card_widget.dart';
import 'package:sonjagapp/Widgets/button_widget.dart';
import 'package:sonjagapp/Widgets/textformfield_widget.dart';

import '../Constants/constants.dart';

class EntryThroughVoterListScreen extends StatefulWidget {
  const EntryThroughVoterListScreen({super.key});

  @override
  State<EntryThroughVoterListScreen> createState() =>
      _EntryThroughVoterListScreenState();
}

class _EntryThroughVoterListScreenState
    extends State<EntryThroughVoterListScreen> {
  // form validate global state
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ScrollController _scrollController = ScrollController();

  // text field controller
  final TextEditingController _boothNoController = TextEditingController();
  final TextEditingController _pageNoController = TextEditingController();

  // Initial Selected Value
  String defaultValue = '';

  // load value
  String? loadUserLevel;
  String? loadBoothNo;
  String? loadPageNo;

  // result show card
  bool _isShowCard = false;

  // List of items in our dropdown menu
  List<String> items = [
    'Jayadev',
    'Bhubaneswar Central',
    'Bhubaneswar North',
    'Ekamra Bhubaneswar',
    'Jatani',
    'Begunia',
    'Khurda',
    'Chilika',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 36.0,
          titleSpacing: 0.0,
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                size: 20.0,
                color: Colors.white,
              )),
          centerTitle: true,
          title: const Text(
            'Entry through Voter List',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: Constants.fontLarge,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchScreen()));
                },
                child: const Icon(
                  Icons.search,
                  size: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
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
        ),
        body: SizedBox(
          width: double.infinity,
          height: size.height,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Card(
                        color: Colors.white,
                        margin: EdgeInsets.zero,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: size.width,
                                child: DropdownButtonFormField<String>(
                                  value: defaultValue.isNotEmpty
                                      ? defaultValue
                                      : null,
                                  hint: Text(
                                    'Assembly',
                                    style: TextStyle(
                                        color: Constants.kSecondaryThemeColor
                                            .withOpacity(0.6),
                                        fontSize: Constants.fontRegular,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  isExpanded: true,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  isDense: true,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    errorMaxLines: 2,
                                    filled: true,
                                    fillColor: Constants.kLightThemeColor,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    errorStyle: const TextStyle(
                                        color: Colors.red,
                                        fontSize: Constants.fontSmall,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  // selectedItemBuilder: (context) => items
                                  //     .map(
                                  //       (e) => Text(
                                  //         e,
                                  //         style: const TextStyle(
                                  //             fontSize: Constants.fontRegular,
                                  //             color: Colors.black54,
                                  //             fontWeight: FontWeight.w500),
                                  //       ),
                                  //     )
                                  //     .toList(),
                                  items: items
                                      .map(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                          alignment: Alignment.centerLeft,
                                          value: value,
                                          enabled:
                                              value == 'Ekamra Bhubaneswar',
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                              color:
                                                  value != 'Ekamra Bhubaneswar'
                                                      ? Colors.black45
                                                      : Colors.black,
                                              fontSize: Constants.fontRegular,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          onTap: () {
                                            print(value);
                                          },
                                        ),
                                      )
                                      .toList(),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Constants.kPrimaryThemeColor,
                                    size: 26.0,
                                  ),
                                  validator: (String? value) {
                                    if (value == null) {
                                      return 'Required';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (value) {
                                    defaultValue = value!;
                                    // print(defaultValue);
                                  },
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: FormFieldWidget(
                                      controller: _boothNoController,
                                      hintText: 'Booth number',
                                      isPrefixIcon: false,
                                      isSuffixIcon: false,
                                      maxLength: 3,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Required';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onChanged: (value) {},
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Expanded(
                                    child: FormFieldWidget(
                                      controller: _pageNoController,
                                      hintText: 'Page number',
                                      keyboardType: TextInputType.number,
                                      maxLength: 3,
                                      isPrefixIcon: false,
                                      isSuffixIcon: false,
                                      suffixText: '31',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Required';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              MaterialButtonWidget(
                                size: size,
                                widget: const Text(
                                  'Load',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Constants.fontRegular,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    print('Success');
                                    setState(() {
                                      _isShowCard = true;

                                      loadBoothNo = _boothNoController.text
                                          .trim()
                                          .toString();
                                      loadPageNo = _pageNoController.text
                                          .trim()
                                          .toString();
                                    });
                                  } else {
                                    print('Error');
                                    setState(() {
                                      _isShowCard = false;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    _isShowCard
                        ? Column(
                            children: [
                              Container(
                                width: size.width,
                                margin: EdgeInsets.only(
                                    bottom: size.height * 0.016,
                                    top: size.height * 0.026),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Section No: 1",
                                      style: TextStyle(
                                        color: Constants.kPrimaryThemeColor,
                                        fontSize: Constants.fontRegular,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Total Voters: 30",
                                      style: TextStyle(
                                        color: Constants.kPrimaryThemeColor,
                                        fontSize: Constants.fontRegular,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                itemCount: 10,
                                clipBehavior: Clip.none,
                                padding: EdgeInsets.zero,
                                controller: _scrollController,
                                keyboardDismissBehavior:
                                    ScrollViewKeyboardDismissBehavior.onDrag,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => Container(
                                  margin: EdgeInsets.only(
                                      bottom: size.height * 0.016),
                                  child: VoterDetailsCard(
                                    acNo: '111',
                                    boothNo: loadBoothNo.toString(),
                                    pageNo: loadPageNo.toString(),
                                    serialNo: '${index + 1}'.toString(),
                                    voteIndexNo: '${index + 1}'.toString(),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(width: 0.0),
                    _isShowCard
                        ? Row(
                            children: [
                              ElevatedIconButtonWidget(
                                size: size,
                                textDirection: TextDirection.ltr,
                                icon: Icons.arrow_back,
                                label: 'Previous Page',
                              ),
                              const SizedBox(width: 10),
                              ElevatedIconButtonWidget(
                                size: size,
                                textDirection: TextDirection.rtl,
                                icon: Icons.arrow_back,
                                label: 'Next Page',
                              ),
                            ],
                          )
                        : Container(width: 0.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
