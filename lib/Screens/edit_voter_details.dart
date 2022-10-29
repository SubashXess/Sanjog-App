// ignore_for_file: avoid_print

import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sonjagapp/Components/gradients.dart';
import 'package:sonjagapp/Components/showsnackbar.dart';
import 'package:sonjagapp/Models/user_data_model.dart';
import 'package:sonjagapp/Services/service.dart';
import 'package:sonjagapp/Widgets/textformfield_widget.dart';
import '../Constants/constants.dart';
import '../Widgets/button_widget.dart';

class EditDetailsScreen extends StatefulWidget {
  const EditDetailsScreen(
      {super.key,
      required this.voterId,
      required this.acNo,
      this.details,
      required this.boothNo,
      required this.id});

  final String voterId;
  final String id;
  final String acNo;
  final String boothNo;
  final UserDataModel? details;

  @override
  State<EditDetailsScreen> createState() => _EditDetailsScreenState();
}

class _EditDetailsScreenState extends State<EditDetailsScreen> {
  // form validate global state
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Text Editing Controller
  final TextEditingController _mobileNoController = TextEditingController();
  final TextEditingController _whatsappNoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _domController = TextEditingController();
  final TextEditingController _postBJPController = TextEditingController();

  // FocusNode
  late FocusNode _positionNode;
  late FocusNode _categoryNode;
  late FocusNode _mobileNode;
  late FocusNode _wpNoNode;
  late FocusNode _addressNode;
  late FocusNode _dobNode;
  late FocusNode _domNode;
  late FocusNode _bloodNode;
  late FocusNode _postBJPNode;
  late FocusNode _socialNode;

  String? marriage;

  // Model
  List<UserDataModel> voterDetails = [];

  // Initial Selected Value
  String? positionDefaultValue;
  String? categoryDefaultValue;
  String? bloodGroupDefaultValue;
  String? socialOrgDefaultValue;

  // List of items in our dropdown menu
  List<String> positionItems = ['PP', 'PC', 'None'];
  List<String> categoryItems = ['ST', 'SC', 'OBC', 'General', 'None'];
  List<String> bloodGroupItems = [
    'O+',
    'O-',
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'None'
  ];
  List<String> socialOrgItems = [
    'SHG',
    'NGO',
    'Village or Ward level committee',
    'Not Applicable',
  ];

  // Variables
  // Image add
  File? image;
  String? loadImage;

  @override
  void initState() {
    super.initState();
    _setControllerData();
    _mobileNoController.addListener(onListen);
    _whatsappNoController.addListener(onListen);
    _addressController.addListener(onListen);
    _dobController.addListener(onListen);
    _domController.addListener(onListen);
    _postBJPController.addListener(onListen);
    _positionNode = FocusNode()..addListener(onListen);
    _categoryNode = FocusNode()..addListener(onListen);
    _mobileNode = FocusNode()..addListener(onListen);
    _wpNoNode = FocusNode()..addListener(onListen);
    _addressNode = FocusNode()..addListener(onListen);
    _dobNode = FocusNode()..addListener(onListen);
    _domNode = FocusNode()..addListener(onListen);
    _bloodNode = FocusNode()..addListener(onListen);
    _postBJPNode = FocusNode()..addListener(onListen);
    _socialNode = FocusNode()..addListener(onListen);
  }

  @override
  void dispose() {
    super.dispose();
    _mobileNoController.dispose();
    _whatsappNoController.dispose();
    _addressController.dispose();
    _dobController.dispose();
    _domController.dispose();
    _postBJPController.dispose();
    _mobileNoController.removeListener(onListen);
    _whatsappNoController.removeListener(onListen);
    _addressController.removeListener(onListen);
    _dobController.removeListener(onListen);
    _domController.removeListener(onListen);
    _postBJPController.removeListener(onListen);
    _positionNode.dispose();
    _categoryNode.dispose();
    _mobileNode.dispose();
    _wpNoNode.dispose();
    _addressNode.dispose();
    _dobNode.dispose();
    _domNode.dispose();
    _bloodNode.dispose();
    _postBJPNode.dispose();
    _socialNode.dispose();
    _positionNode.removeListener(onListen);
    _categoryNode.removeListener(onListen);
    _mobileNode.removeListener(onListen);
    _wpNoNode.removeListener(onListen);
    _addressNode.removeListener(onListen);
    _dobNode.removeListener(onListen);
    _domNode.removeListener(onListen);
    _bloodNode.removeListener(onListen);
    _postBJPNode.removeListener(onListen);
    _socialNode.removeListener(onListen);
  }

  void onListen() {
    setState(() {});
  }

  void _setControllerData() {
    _mobileNoController.text = _mobileNoController.text.isEmpty
        ? widget.details!.mobileNo.toString()
        : _mobileNoController.text;

    _whatsappNoController.text = _whatsappNoController.text.isEmpty
        ? widget.details!.whatsappNo.toString()
        : _whatsappNoController.text;

    _addressController.text = _addressController.text.isEmpty
        ? widget.details!.address.toString()
        : _addressController.text;

    _dobController.text = _dobController.text.isEmpty
        ? widget.details!.dob.toString()
        : _dobController.text;

    _domController.text = _domController.text.isEmpty
        ? widget.details!.dom.toString()
        : _domController.text;

    _postBJPController.text = _postBJPController.text.isEmpty
        ? widget.details!.postBJP.toString()
        : _postBJPController.text;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(_mobileNoController.text);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 36.0,
          titleSpacing: 0.0,
          centerTitle: true,
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
            'Edit Voter Details',
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
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        fit: StackFit.loose,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade400,
                            radius: size.width * 0.14,
                            child: image != null
                                ? CircleAvatar(
                                    backgroundColor: Colors.grey.shade200,
                                    radius: size.width * 0.132,
                                    backgroundImage: FileImage(image!),
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.grey.shade200,
                                    radius: size.width * 0.132,
                                    child: Icon(
                                      Icons.person_rounded,
                                      color: Colors.grey.shade400,
                                      size: size.width * 0.12,
                                    ),
                                  ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 14.0,
                              child: IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      isDismissible: true,
                                      enableDrag: true,
                                      context: context,
                                      builder: (context) {
                                        return bottomSheet(context);
                                      });
                                },
                                padding: EdgeInsets.zero,
                                splashRadius: 20.0,
                                icon: const Icon(
                                  Icons.camera_alt,
                                  size: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      SizedBox(
                        width: size.width,
                        child: Text(
                          // widget.details!.name.toString(),
                          '${widget.details!.fname} ${widget.details!.mname} ${widget.details!.lname}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: Constants.fontLarge,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Voter Id:',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: Constants.fontRegular,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            widget.voterId,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: Constants.fontRegular,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Aadhar No:',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: Constants.fontRegular,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            widget.details!.adharNo.toString(),
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: Constants.fontRegular,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AC No:',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: Constants.fontRegular,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 6.0),
                          Text(
                            widget.details!.acNo.toString(),
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: Constants.fontRegular,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.04),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'Position',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: Constants.fontSmall,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                SizedBox(
                                  width: size.width,
                                  child: DropdownButtonFormField<String>(
                                    // value: positionDefaultValue,
                                    value: widget.details!.position == 'null'
                                        ? null
                                        : positionDefaultValue ??
                                            widget.details!.position,
                                    focusNode: _positionNode,
                                    hint: const Text(
                                      'Position',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: Constants.fontRegular,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    isExpanded: true,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    isDense: true,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                      errorMaxLines: 2,
                                      filled: true,
                                      fillColor: Colors.grey.shade200,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      errorStyle: const TextStyle(
                                          color: Colors.red,
                                          fontSize: Constants.fontSmall,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                    items: positionItems
                                        .map(
                                          (String value) =>
                                              DropdownMenuItem<String>(
                                            alignment: Alignment.centerLeft,
                                            value: value,
                                            // enabled: value == 'Ekamra Bhubaneswar',
                                            child: Text(
                                              value,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: Constants.fontRegular,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    icon: Icon(
                                      Icons.arrow_drop_down_rounded,
                                      color: Colors.grey.shade400,
                                      size: 26.0,
                                    ),
                                    onChanged: (value) {
                                      positionDefaultValue = value!;
                                      print(positionDefaultValue);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'Category',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: Constants.fontSmall,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                SizedBox(
                                  width: size.width,
                                  child: DropdownButtonFormField<String>(
                                    value: widget.details!.category == 'null'
                                        ? null
                                        : categoryDefaultValue ??
                                            widget.details!.category,
                                    // value: categoryDefaultValue,
                                    focusNode: _categoryNode,
                                    hint: const Text(
                                      'Category',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: Constants.fontRegular,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    isExpanded: true,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    isDense: true,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                      errorMaxLines: 2,
                                      filled: true,
                                      fillColor: Colors.grey.shade200,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      errorStyle: const TextStyle(
                                          color: Colors.red,
                                          fontSize: Constants.fontSmall,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                    items: categoryItems
                                        .map(
                                          (String value) =>
                                              DropdownMenuItem<String>(
                                            alignment: Alignment.centerLeft,
                                            value: value,
                                            // enabled: value == 'Ekamra Bhubaneswar',
                                            child: Text(
                                              value,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: Constants.fontRegular,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    icon: Icon(
                                      Icons.arrow_drop_down_rounded,
                                      color: Colors.grey.shade400,
                                      size: 26.0,
                                    ),
                                    onChanged: (value) {
                                      categoryDefaultValue = value!;
                                      print(categoryDefaultValue);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Mobile No',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: Constants.fontSmall,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      FormFieldWidget(
                                        controller: _mobileNoController,
                                        focusNode: _mobileNode,
                                        autofillHints: const [
                                          AutofillHints.telephoneNumber
                                        ],
                                        isPrefixIcon: false,
                                        isSuffixIcon: false,
                                        keyboardType: TextInputType.phone,
                                        maxLength: 10,
                                        // validator: mobileValidator,
                                        onChanged: (value) {
                                          print(value);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Whatsapp No',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: Constants.fontSmall,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      FormFieldWidget(
                                        controller: _whatsappNoController,
                                        focusNode: _wpNoNode,
                                        autofillHints: const [
                                          AutofillHints.telephoneNumber
                                        ],
                                        isPrefixIcon: false,
                                        isSuffixIcon: false,
                                        keyboardType: TextInputType.phone,
                                        maxLength: 10,
                                        validator: whatsappValidator,
                                        onChanged: (value) {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            const Text(
                              'Present Address',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: Constants.fontSmall,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            FormFieldWidget(
                              controller: _addressController,
                              focusNode: _addressNode,
                              autofillHints: const [AutofillHints.addressCity],
                              isPrefixIcon: false,
                              isSuffixIcon: false,
                              keyboardType: TextInputType.multiline,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              maxLength: 100,
                              maxLines: 3,
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 16.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Date of Birth',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: Constants.fontSmall,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      FormFieldWidget(
                                        controller: _dobController,
                                        focusNode: _dobNode,
                                        hintText: 'DD-MM-YYYY',
                                        isPrefixIcon: false,
                                        isSuffixIcon: false,
                                        readOnly: true,
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: _dobController
                                                    .text.isEmpty
                                                ? DateTime.now()
                                                : DateTime.parse(DateFormat(
                                                        'yyyy-MM-dd') // dd-MM-yyyy
                                                    .format(DateTime.parse(
                                                        _dobController.text))),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2101),
                                          );

                                          if (pickedDate != null) {
                                            print(pickedDate);
                                            String formattedDate = DateFormat(
                                                    'yyyy-MM-dd') // dd-MM-yyyy
                                                .format(pickedDate);
                                            print(formattedDate);
                                            setState(() {
                                              _dobController.text =
                                                  formattedDate;
                                            });
                                          } else {
                                            print('Date is not selected');
                                          }
                                        },
                                        // validator: dobValidator,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Date of Marriage',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: Constants.fontSmall,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      FormFieldWidget(
                                        controller: _domController,
                                        focusNode: _domNode,
                                        hintText: 'DD-MM-YYYY',
                                        isPrefixIcon: false,
                                        isSuffixIcon: false,
                                        readOnly: true,
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: _domController
                                                          .text.isEmpty
                                                      ? DateTime.now()
                                                      : DateTime.parse(DateFormat(
                                                              'yyyy-MM-dd') // dd-MM-yyyy
                                                          .format(
                                                              DateTime.parse(
                                                                  _domController
                                                                      .text))),
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime(2101));

                                          if (pickedDate != null) {
                                            print(pickedDate);
                                            String formattedDate = DateFormat(
                                                    'yyyy-MM-dd') // dd-MM-yyyy
                                                .format(pickedDate);
                                            print(formattedDate);
                                            setState(() {
                                              _domController.text =
                                                  formattedDate;
                                            });
                                          } else {
                                            print('Date is not selected');
                                          }
                                        },
                                        // validator: domValidator,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Blood Group',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: Constants.fontSmall,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                SizedBox(
                                  width: size.width,
                                  child: DropdownButtonFormField<String>(
                                    // value: bloodGroupDefaultValue,
                                    value: widget.details!.bloodGroup == 'null'
                                        ? null
                                        : bloodGroupDefaultValue ??
                                            widget.details!.bloodGroup,
                                    focusNode: _bloodNode,
                                    hint: const Text(
                                      'Select your blood group',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: Constants.fontRegular,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    isExpanded: false,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    isDense: true,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                      errorMaxLines: 2,
                                      filled: true,
                                      fillColor: Colors.grey.shade200,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      errorStyle: const TextStyle(
                                          color: Colors.red,
                                          fontSize: Constants.fontSmall,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                    items: bloodGroupItems
                                        .map(
                                          (String value) =>
                                              DropdownMenuItem<String>(
                                            alignment: Alignment.center,
                                            value: value,
                                            // enabled: value == 'Ekamra Bhubaneswar',
                                            child: Text(
                                              value,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: Constants.fontRegular,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    icon: Icon(
                                      Icons.arrow_drop_down_rounded,
                                      color: Colors.grey.shade400,
                                      size: 26.0,
                                    ),
                                    // validator: bloodValidator,
                                    onChanged: (value) {
                                      bloodGroupDefaultValue = value!;
                                      print(bloodGroupDefaultValue);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            const Text(
                              'Post in BJP',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: Constants.fontSmall,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            FormFieldWidget(
                              controller: _postBJPController,
                              focusNode: _postBJPNode,
                              isPrefixIcon: false,
                              isSuffixIcon: false,
                              keyboardType: TextInputType.text,
                              maxLength: 40,
                              // validator: postInBJPValidator,
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 16.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Social Organisation',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: Constants.fontSmall,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                SizedBox(
                                  width: size.width,
                                  child: DropdownButtonFormField<String>(
                                    // value: socialOrgDefaultValue,
                                    value: widget.details!.socialOrg == 'null'
                                        ? null
                                        : socialOrgDefaultValue ??
                                            widget.details!.socialOrg,
                                    focusNode: _socialNode,
                                    hint: const Text(
                                      'Select social organisation',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: Constants.fontRegular,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    isExpanded: true,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    isDense: true,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                      errorMaxLines: 1,
                                      filled: true,
                                      fillColor: Colors.grey.shade200,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      errorStyle: const TextStyle(
                                          color: Colors.red,
                                          fontSize: Constants.fontSmall,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                    items: socialOrgItems
                                        .map(
                                          (String value) =>
                                              DropdownMenuItem<String>(
                                            alignment: Alignment.centerLeft,
                                            value: value,
                                            child: Text(
                                              value,
                                              style: const TextStyle(
                                                color: Colors.black,
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
                                    icon: Icon(
                                      Icons.arrow_drop_down_rounded,
                                      color: Colors.grey.shade400,
                                      size: 26.0,
                                    ),
                                    // validator: socialOrgValidator,
                                    onChanged: (value) {
                                      socialOrgDefaultValue = value!;
                                      print(socialOrgDefaultValue);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      // MaterialButtonWidget(
                      //   size: size,
                      //   widget: const Text('Check'),
                      //   onPressed: () {
                      //     setState(() {});
                      //     print(
                      //         'Check TextController : ${_mobileNoController.text.runtimeType}');
                      //     print(
                      //         'Check TextController : ${_mobileNoController.text}');
                      //     print(
                      //         'Check database : ${widget.details!.mobileNo.runtimeType}');
                      //     print('Check database : ${widget.details!.mobileNo}');
                      //   },
                      // ),
                      // const SizedBox(height: 16.0),
                      MaterialButtonWidget(
                        size: size,
                        widget: const Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('Success');
                            setState(() {
                              _positionNode.unfocus();
                              _categoryNode.unfocus();
                              _mobileNode.unfocus();
                              _wpNoNode.unfocus();
                              _addressNode.unfocus();
                              _dobNode.unfocus();
                              _domNode.unfocus();
                              _bloodNode.unfocus();
                              _postBJPNode.unfocus();
                              _socialNode.unfocus();
                            });

                            APIServices.updateUserData(
                              context,
                              id: widget.details!.id.toString(),
                              loginUserId: widget.details!.userId.toString(),
                              photo: image.toString(),
                              position: positionDefaultValue ??
                                  widget.details!.position.toString(),
                              category: categoryDefaultValue ??
                                  widget.details!.category.toString(),
                              mobile: _mobileNoController.text,
                              wpNumber:
                                  _whatsappNoController.text.trim().toString(),
                              address: _addressController.text,
                              dob: _dobController.text.toString(),
                              dom: _domController.text.toString(),
                              bloodGroup: bloodGroupDefaultValue ??
                                  widget.details!.bloodGroup.toString(),
                              postBJP: _postBJPController.text.toString(),
                              socialOrg: socialOrgDefaultValue ??
                                  widget.details!.socialOrg.toString(),
                            );

                            showSnackBar(
                                context, 'Your updates have been successfully');
                          } else {
                            print('Error');
                            showSnackBar(
                                context, 'Please fill out all required fields');
                          }
                        },
                      ),
                      // SizedBox(height: size.height * 0.04),
                      // NormalTextButtonWidget(
                      //   label: 'Clear all the fields',
                      //   fontSize: Constants.fontRegular,
                      //   onPressed: () {
                      //     setState(() {
                      //       positionDefaultValue = null;
                      //       categoryDefaultValue = null;
                      //       bloodGroupDefaultValue = null;
                      //       socialOrgDefaultValue = null;
                      //       _mobileNoController.clear();
                      //       _whatsappNoController.clear();
                      //       _addressController.clear();
                      //       _dobController.clear();
                      //       _domController.clear();
                      //       _postBJPController.clear();
                      //       _positionNode.unfocus();
                      //       _categoryNode.unfocus();
                      //       _mobileNode.unfocus();
                      //       _wpNoNode.unfocus();
                      //       _addressNode.unfocus();
                      //       _dobNode.unfocus();
                      //       _domNode.unfocus();
                      //       _bloodNode.unfocus();
                      //       _postBJPNode.unfocus();
                      //       _socialNode.unfocus();
                      //     });
                      //   },
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? mobileValidator(String? value) {
    if (value!.isEmpty) {
      return 'Required';
    } else {
      bool result = checkPhone(value);
      if (result == true) {
        // print('mobile : $value');
        return null;
      } else {
        return 'Invalid number';
      }
    }
  }

  String? whatsappValidator(String? value) {
    if (value!.isEmpty) {
      return null;
    } else {
      bool result = checkPhone(value);
      if (result == true) {
        // print('mobile : $value');
        return null;
      } else {
        return 'Invalid number';
      }
    }
  }

  bool checkPhone(String value) {
    // Pattern pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    Pattern pattern = r'^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[6789]\d{9}$';
    RegExp regExp = RegExp(pattern.toString());
    return (!regExp.hasMatch(value)) ? false : true;
  }

  String? domValidator(String? value) {
    if (value!.isEmpty) {
      return 'Required';
    } else {
      return null;
    }
  }

  String? dobValidator(String? value) {
    if (value!.isEmpty) {
      return 'Required';
    } else {
      return null;
    }
  }

  String? bloodValidator(String? value) {
    if (value == null) {
      return 'Required';
    } else {
      return null;
    }
  }

  String? postInBJPValidator(String? value) {
    if (value!.isEmpty) {
      return 'Required';
    } else {
      return null;
    }
  }

  String? socialOrgValidator(String? value) {
    if (value == null) {
      return 'Required';
    } else {
      return null;
    }
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(6.0)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Choose profile photo',
            style: TextStyle(
              fontSize: Constants.fontLarge,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Divider(height: 24.0),
          Expanded(
            child: InkWell(
              onTap: () => pickImage(ImageSource.camera, context),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: size.height * 0.024,
                    backgroundColor: Constants.kPrimaryThemeColor,
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      'Camera',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: Constants.fontRegular,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: size.height * 0.006),
          Expanded(
            child: InkWell(
              onTap: () => pickImage(ImageSource.gallery, context),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: size.height * 0.024,
                    backgroundColor: Colors.green.shade800,
                    child: const Icon(
                      Icons.image_rounded,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: Constants.fontRegular,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future pickImage(ImageSource source, BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      // permanent image
      final imagePermanent = await saveImagePermanently(image.path);

      setState(() {
        // this.image = imageTemporary;
        this.image = imagePermanent;
        loadImage = imagePermanent.toString();
        print("Load Image : $loadImage");
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = path.basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  Future<Widget?> _circularDialogBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
