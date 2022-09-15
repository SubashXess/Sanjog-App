// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sonjagapp/Components/gradients.dart';
import 'package:sonjagapp/Widgets/textformfield_widget.dart';

import '../Constants/constants.dart';
import '../Widgets/button_widget.dart';

class AddDetailsScreen extends StatefulWidget {
  const AddDetailsScreen(
      {super.key, required this.voterId, required this.acNo});

  final String voterId;
  final String acNo;

  @override
  State<AddDetailsScreen> createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {
  // form validate global state
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Text Editing Controller
  final TextEditingController _mobileNoController = TextEditingController();
  final TextEditingController _whatsappNoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _postBJPController = TextEditingController();

  // Initial Selected Value
  String positionDefaultValue = '';
  String categoryDefaultValue = '';
  String bloodGroupDefaultValue = '';
  String socialOrgDefaultValue = '';

  // List of items in our dropdown menu
  List<String> positionItems = ['PP', 'PC'];
  List<String> categoryItems = ['ST', 'SC', 'OBC', 'General'];
  List<String> bloodGroupItems = [
    'O+',
    'O-',
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-'
  ];
  List<String> socialOrgItems = [
    'SHG',
    'NGO',
    'Village or Ward level committee',
    'Not Applicable'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _mobileNoController.dispose();
    _whatsappNoController.dispose();
    _addressController.dispose();
    _postBJPController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 36.0,
          titleSpacing: 0.0,
          centerTitle: true,
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                size: 20.0,
                color: Colors.white,
              )),
          title: const Text('Add Voter Details'),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Voter Id: YXV0934471',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: Constants.fontSmall,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'AC No: 111',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: Constants.fontSmall,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: size.width,
                              child: DropdownButtonFormField<String>(
                                value: positionDefaultValue.isNotEmpty
                                    ? positionDefaultValue
                                    : null,
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
                                  positionDefaultValue = value!;
                                  // print(defaultValue);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: SizedBox(
                              width: size.width,
                              child: DropdownButtonFormField<String>(
                                value: categoryDefaultValue.isNotEmpty
                                    ? categoryDefaultValue
                                    : null,
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
                                  categoryDefaultValue = value!;
                                  // print(defaultValue);
                                },
                              ),
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
                                        autofillHints: const [
                                          AutofillHints.telephoneNumber
                                        ],
                                        isPrefixIcon: false,
                                        isSuffixIcon: false,
                                        keyboardType: TextInputType.phone,
                                        maxLength: 10,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Required';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (value) {},
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
                                        autofillHints: const [
                                          AutofillHints.telephoneNumber
                                        ],
                                        isPrefixIcon: false,
                                        isSuffixIcon: false,
                                        keyboardType: TextInputType.phone,
                                        maxLength: 10,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Required';
                                          } else {
                                            return null;
                                          }
                                        },
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
                              autofillHints: const [AutofillHints.addressCity],
                              isPrefixIcon: false,
                              isSuffixIcon: false,
                              keyboardType: TextInputType.text,
                              maxLength: 80,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                } else {
                                  return null;
                                }
                              },
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
                                    children: const [
                                      Text(
                                        'Date of Birth',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: Constants.fontSmall,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      FormFieldWidget(),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Date of Marriage',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: Constants.fontSmall,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      FormFieldWidget(),
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
                                    value: bloodGroupDefaultValue.isNotEmpty
                                        ? bloodGroupDefaultValue
                                        : null,
                                    hint: const Text(
                                      'Select your blood group',
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
                                      fillColor: Constants.kLightThemeColor,
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
                                    items: bloodGroupItems
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
                                      bloodGroupDefaultValue = value!;
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
                              isPrefixIcon: false,
                              isSuffixIcon: false,
                              keyboardType: TextInputType.text,
                              maxLength: 40,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                } else {
                                  return null;
                                }
                              },
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
                                    value: socialOrgDefaultValue.isNotEmpty
                                        ? socialOrgDefaultValue
                                        : null,
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
                                      errorMaxLines: 2,
                                      filled: true,
                                      fillColor: Constants.kLightThemeColor,
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
                                    items: socialOrgItems
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
                                      socialOrgDefaultValue = value!;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      MaterialButtonWidget(
                        size: size,
                        widget: const Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('Success');
                          } else {
                            print('Error');
                          }
                        },
                      ),
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
}
