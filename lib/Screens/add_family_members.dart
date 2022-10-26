// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sonjagapp/Components/gradients.dart';
import 'package:sonjagapp/Components/or_divider.dart';
import 'package:sonjagapp/Constants/constants.dart';
import 'package:sonjagapp/Widgets/button_widget.dart';
import 'package:sonjagapp/Widgets/textformfield_widget.dart';

class AddFamilyMembers extends StatefulWidget {
  const AddFamilyMembers({super.key});

  @override
  State<AddFamilyMembers> createState() => _AddFamilyMembersState();
}

class _AddFamilyMembersState extends State<AddFamilyMembers> {
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
  final TextEditingController _relFirstNameController = TextEditingController();
  final TextEditingController _relLastNameController = TextEditingController();
  final TextEditingController _aadharController = TextEditingController();

  // FocusNode
  late FocusNode _voterNoNode;
  late FocusNode _fNameNode;
  late FocusNode _lNameNode;
  late FocusNode _relFNameNode;
  late FocusNode _relLNameNode;
  late FocusNode _aadharNoNode;

  // Variables
  final bool _autovalidateMode = false;

  @override
  void initState() {
    super.initState();
    _voterNoController.addListener(onListen);
    _aadharController.addListener(onListen);
    _firstNameController.addListener(onListen);
    _lastNameController.addListener(onListen);
    _relFirstNameController.addListener(onListen);
    _relLastNameController.addListener(onListen);
    _voterNoNode = FocusNode()..addListener(onListen);
    _fNameNode = FocusNode()..addListener(onListen);
    _lNameNode = FocusNode()..addListener(onListen);
    _relFNameNode = FocusNode()..addListener(onListen);
    _relLNameNode = FocusNode()..addListener(onListen);
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
    _relFirstNameController.dispose();
    _relFirstNameController.removeListener(onListen);
    _relLastNameController.dispose();
    _relLastNameController.removeListener(onListen);
    _voterNoNode.dispose();
    _voterNoNode.removeListener(onListen);
    _fNameNode.dispose();
    _fNameNode.removeListener(onListen);
    _lNameNode.dispose();
    _lNameNode.removeListener(onListen);
    _aadharNoNode.dispose();
    _aadharNoNode.removeListener(onListen);
    _relFNameNode.dispose();
    _relFNameNode.removeListener(onListen);
    _relLNameNode.dispose();
    _relLNameNode.removeListener(onListen);
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
            'Add Family Members',
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
        body: SingleChildScrollView(
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
                      ],
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                orDivider(
                    label: const Text('Or'), borderColor: Colors.grey.shade400),
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
                    label: const Text('Or'), borderColor: Colors.grey.shade400),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: size.width,
                  child: Form(
                    key: _formKey3,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: FormFieldWidget(
                                controller: _firstNameController,
                                autovalidateMode: _autovalidateMode
                                    ? AutovalidateMode.onUserInteraction
                                    : AutovalidateMode.disabled,
                                focusNode: _fNameNode,
                                hintText: 'First Name',
                                isPrefixIcon: false,
                                isSuffixIcon: false,
                                keyboardType: TextInputType.name,
                                onChanged: (value) {},
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
                                hintText: 'Last Name',
                                isPrefixIcon: false,
                                isSuffixIcon: false,
                                keyboardType: TextInputType.name,
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Expanded(
                              child: FormFieldWidget(
                                controller: _relFirstNameController,
                                autovalidateMode: _autovalidateMode
                                    ? AutovalidateMode.onUserInteraction
                                    : AutovalidateMode.disabled,
                                focusNode: _relFNameNode,
                                hintText: 'Rel. First Name',
                                isPrefixIcon: false,
                                isSuffixIcon: false,
                                keyboardType: TextInputType.name,
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Expanded(
                              child: FormFieldWidget(
                                controller: _relLastNameController,
                                autovalidateMode: _autovalidateMode
                                    ? AutovalidateMode.onUserInteraction
                                    : AutovalidateMode.disabled,
                                focusNode: _relLNameNode,
                                hintText: 'Rel. Last Name',
                                isPrefixIcon: false,
                                isSuffixIcon: false,
                                keyboardType: TextInputType.name,
                                onChanged: (value) {},
                              ),
                            ),
                          ],
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
            ),
          ),
        ),
      ),
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
