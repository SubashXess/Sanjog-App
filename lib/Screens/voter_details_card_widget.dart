// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:sonjagapp/Constants/constants.dart';
import 'package:sonjagapp/Screens/add_family_members.dart';
import 'package:sonjagapp/Screens/see_family_members.dart';
import 'package:sonjagapp/Widgets/button_widget.dart';
import 'package:sonjagapp/Widgets/text_button_widget.dart';
import 'package:sonjagapp/Widgets/textformfield_widget.dart';

class VoterDetailsCard extends StatefulWidget {
  const VoterDetailsCard({
    Key? key,
    required this.serialNo,
    required this.acNo,
    required this.boothNo,
    required this.pageNo, required this.voteIndexNo,
  }) : super(key: key);

  final String acNo;
  final String boothNo;
  final String pageNo;
  final String serialNo;
  final String voteIndexNo;

  @override
  State<VoterDetailsCard> createState() => _VoterDetailsCardState();
}

class _VoterDetailsCardState extends State<VoterDetailsCard> {
  // Image add
  File? image;
  String? loadImage;

  bool _isLongPressed = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            width: size.width,
            child: Card(
              margin: EdgeInsets.zero,
              color: Colors.white,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
                side: BorderSide(color: Colors.grey.shade400, width: 1.0),
              ),
              child: SizedBox(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        runSpacing: 5.0,
                        spacing: 0.0,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'AcNo: ${widget.acNo}'.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: Constants.fontSmall,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: size.width * 0.012),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Constants.kPrimaryThemeColor,
                            ),
                            child: const Text(
                              'Booth No: 1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Constants.fontSmall,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.012),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Constants.kPrimaryThemeColor,
                            ),
                            child: const Text(
                              'Page No: 3',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Constants.fontSmall,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.012),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Constants.kPrimaryThemeColor,
                            ),
                            child: Text(
                              'Serial No: ${widget.serialNo.toString()}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: Constants.fontSmall,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.012),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // width: 30.0,
                            // height: 30.0,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Constants.kLightThemeColor,
                              border: Border.all(
                                  color: Constants.kPrimaryThemeColor,
                                  width: 1.0),
                            ),
                            child:  Text(
                              // '1',
                              widget.voteIndexNo.toString(),
                              style: const TextStyle(
                                color: Constants.kPrimaryThemeColor,
                                fontSize: Constants.fontSmall,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.036),
                          const Text(
                            'YXV0934471',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: Constants.fontSmall,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(width: size.width * 0.036),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Constants.kPrimaryThemeColor,
                            ),
                            child: const Text(
                              'PP',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Constants.fontSmall,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          // SizedBox(width: size.width * 0.012),
                        ],
                      ),
                      SizedBox(height: size.height * 0.012),
                      SizedBox(
                        width: size.width,
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          runSpacing: 10.0,
                          spacing: 10.0,
                          children: const [
                            Text(
                              'Name: Paul Buchheit',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: Constants.fontSmall,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Sex: M',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: Constants.fontSmall,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Category: General',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: Constants.fontSmall,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Relation Type: H',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: Constants.fontSmall,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Relation Name: John Carmack',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: Constants.fontSmall,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Mobile No: 1234567890',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: Constants.fontSmall,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Whatsapp No: 1234567890',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: Constants.fontSmall,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.012),
                      MaterialButton(
                        onPressed: () {},
                        color: Constants.kPrimaryThemeColor,
                        height: size.height * 0.04,
                        minWidth: size.width * 0.3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        child: const Text(
                          'Add Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Constants.fontSmall,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.012),
                      SizedBox(
                        width: 120.0,
                        height: 120.0,
                        child: Card(
                          margin: EdgeInsets.zero,
                          color: Colors.red.shade50,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              side: const BorderSide(
                                  color: Constants.kPrimaryThemeColor,
                                  width: 2.0)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: image != null
                              ? Image.file(
                                  image!,
                                  fit: BoxFit.contain,
                                )
                              : Image.asset(
                                  'assets/demo-girl.jpg',
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.012),
                      Row(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              pickImage(ImageSource.gallery, context);
                            },
                            color: Colors.white,
                            height: size.height * 0.04,
                            minWidth: size.width * 0.3,
                            elevation: image != null ? 0.0 : 1.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                side: BorderSide(
                                    width: 1.0, color: Colors.grey.shade300)),
                            child: image != null
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'File uploaded',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: Constants.fontSmall,
                                        ),
                                      ),
                                      SizedBox(width: 4.0),
                                      Icon(
                                        Icons.check,
                                        size: 18.0,
                                        color: Constants.kPrimaryThemeColor,
                                      ),
                                    ],
                                  )
                                : const Text(
                                    'Choose file',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Constants.fontSmall,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                          ),
                          SizedBox(width: size.width * 0.036),
                          Expanded(
                            child: Text(
                              image != null ? "$loadImage" : 'No file chosen',
                              maxLines: 1,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: Constants.fontSmall,
                                fontWeight: FontWeight.normal,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.012),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Add family members',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Constants.fontSmall,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: size.width * 0.04),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AddFamilyMembers(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 26.0,
                                  height: 26.0,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Constants.kLightThemeColor,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Constants.kPrimaryThemeColor,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          NormalTextButtonWidget(
                            label: 'See family members',
                            fontSize: Constants.fontSmall,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SeeFamilyMembers()));
                              // seeFamilyDetailsBuildSheet(context);
                              // showModalBottomSheet(
                              //   context: context,
                              //   backgroundColor: Colors.transparent,
                              //   enableDrag: true,
                              //   isScrollControlled: true,
                              //   builder: (context) => buildSheet(context),
                              // );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSheet(context) {
    Size size = MediaQuery.of(context).size;
    // ScrollController scrollController = ScrollController();
    return DraggableScrollableSheet(
      expand: true,
      // initialChildSize: 0.45,
      // maxChildSize: 0.9,
      // minChildSize: 0.4,
      builder: (context, scrollController) => Container(
        padding: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(6.0)),
          color: Colors.white,
        ),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          shrinkWrap: true,
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

          children: [
            SizedBox(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: size.width / 8,
                    height: 4.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Constants.kPrimaryThemeColor,
                          Color(0xFFF97D09)
                        ], // Color(0xFFF97D09)
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Family Details',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Constants.fontMedium,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Total Records: 3',
              style: TextStyle(
                color: Constants.kPrimaryThemeColor,
                fontWeight: FontWeight.bold,
                fontSize: Constants.fontRegular,
              ),
            ),
            const SizedBox(height: 10.0),
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              clipBehavior: Clip.none,
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              controller: scrollController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return StatefulBuilder(
                    builder: (context, StateSetter setState) {
                  return Card(
                    margin:
                        EdgeInsets.only(bottom: _isLongPressed ? 10.0 : 0.0),
                    elevation: 0.0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        side: _isLongPressed
                            ? const BorderSide(
                                color: Constants.kLightThemeColor, width: 1.0)
                            : BorderSide.none),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Card(
                          margin: EdgeInsets.only(
                              bottom: _isLongPressed ? 0.0 : 10.0),
                          elevation: 0.0,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              side: _isLongPressed
                                  ? BorderSide.none
                                  : const BorderSide(
                                      color: Constants.kLightThemeColor,
                                      width: 1.0)),
                          child: InkWell(
                            splashColor: Constants.kLightThemeColor,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              // _isLongPressed = !_isLongPressed;
                              setState(() => _isLongPressed = !_isLongPressed);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Name of the voter:',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                          fontSize: Constants.fontSmall,
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Expanded(
                                        child: Text(
                                          'Babu Pradhan',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Constants.fontSmall,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10.0),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Rel-Name of the voters:',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                          fontSize: Constants.fontSmall,
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Expanded(
                                        child: Text(
                                          'Bhramara Pradhan',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Constants.fontSmall,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10.0),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Voter ID number:',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                          fontSize: Constants.fontSmall,
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Expanded(
                                        child: Text(
                                          'Rmu1169697'.toUpperCase(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Constants.fontSmall,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10.0),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Mobile number:',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                          fontSize: Constants.fontSmall,
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Expanded(
                                        child: Text(
                                          '1234567890',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Constants.fontSmall,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // TextField(
                                  //   autofocus: true,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        _isLongPressed
                            ? Container(
                                margin: const EdgeInsets.only(
                                    bottom: 10.0, right: 10.0, left: 10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton.icon(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Constants.kLightThemeColor),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                horizontal: 6.0,
                                                vertical: 0.0)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        6.0))),
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        visualDensity: const VisualDensity(
                                            horizontal: -2.0, vertical: -2.0),
                                      ),
                                      icon: const Icon(
                                        Icons.delete,
                                        size: 16.0,
                                        color: Constants.kPrimaryThemeColor,
                                      ),
                                      label: const Text(
                                        'Delete',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color:
                                                Constants.kPrimaryThemeColor),
                                      ),
                                    ),
                                    const SizedBox(width: 36.0),
                                    TextButton.icon(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                // Constants.kLightThemeColor,
                                                Colors.green.shade50),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                horizontal: 6.0,
                                                vertical: 0.0)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        6.0))),
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        visualDensity: const VisualDensity(
                                            horizontal: -2.0, vertical: -2.0),
                                      ),
                                      icon: const Icon(
                                        Icons.edit,
                                        size: 16.0,
                                        // color: Constants.kPrimaryThemeColor,
                                        color: Colors.green,
                                      ),
                                      label: const Text(
                                        'Edit',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          // color: Constants.kPrimaryThemeColor,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(width: 0.0),
                      ],
                    ),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAddFamilyMembersSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScrollController scrollController = ScrollController();
    return Container(
      padding: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(6.0)),
        color: Colors.white,
      ),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        shrinkWrap: true,
        controller: scrollController,
        physics: const ClampingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          SizedBox(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: size.width / 8,
                  height: 4.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Constants.kPrimaryThemeColor,
                        Color(0xFFF97D09)
                      ], // Color(0xFFF97D09)
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Add Family Details',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Constants.fontMedium,
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(height: 10.0),
          // const Text(
          //   'Total Records: 3',
          //   style: TextStyle(
          //     color: Constants.kPrimaryThemeColor,
          //     fontWeight: FontWeight.bold,
          //     fontSize: Constants.fontRegular,
          //   ),
          // ),
          Row(
            children: [
              Expanded(
                // width: size.width / 3.4,
                child: TextFormField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    hintText: 'AC number',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                // width: size.width / 3.4,
                child: TextFormField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Booth number',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                // width: size.width / 3.4,
                child: Column(
                  children: [
                    const Text(
                      'Serial No.',
                      style: TextStyle(
                        color: Constants.kPrimaryThemeColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.fontRegular,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: Constants.kLightThemeColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: const BorderSide(
                              width: 1.0, color: Constants.kPrimaryThemeColor),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future pickImage(ImageSource source, BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;

      // temporary image
      // final imageTemporary = File(image.path);

      // permanent image
      final imagePermanent = await saveImagePermanently(image.path);

      setState(() {
        // this.image = imageTemporary;
        this.image = imagePermanent;
        loadImage = imagePermanent.toString();

        print("Load Image : $loadImage");
      });
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }
}
