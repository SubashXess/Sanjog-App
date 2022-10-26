import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sonjagapp/Components/gradients.dart';
import 'package:sonjagapp/Components/or_divider.dart';
import 'package:sonjagapp/Constants/constants.dart';
import 'package:sonjagapp/Services/textinputformatter_services.dart';
import 'package:sonjagapp/Widgets/button_widget.dart';
import 'package:sonjagapp/Widgets/textformfield_widget.dart';

class AddFamilyMembers extends StatefulWidget {
  const AddFamilyMembers({super.key});

  @override
  State<AddFamilyMembers> createState() => _AddFamilyMembersState();
}

class _AddFamilyMembersState extends State<AddFamilyMembers> {
  final TextEditingController _acNoController = TextEditingController();
  final TextEditingController _boothNoController = TextEditingController();
  final TextEditingController _serialNoController = TextEditingController();
  final TextEditingController _voterNoController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _relFirstController = TextEditingController();
  final TextEditingController _relLastController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _acNoController.addListener(onListen);
    _boothNoController.addListener(onListen);
    _serialNoController.addListener(onListen);
    _voterNoController.addListener(onListen);
    _firstNameController.addListener(onListen);
    _lastNameController.addListener(onListen);
    _relFirstController.addListener(onListen);
    _relLastController.addListener(onListen);
  }

  @override
  void dispose() {
    super.dispose();
    _acNoController.removeListener(onListen);
    _acNoController.dispose();
    _boothNoController.removeListener(onListen);
    _boothNoController.dispose();
    _serialNoController.removeListener(onListen);
    _serialNoController.dispose();
    _voterNoController.removeListener(onListen);
    _voterNoController.dispose();
    _firstNameController.removeListener(onListen);
    _firstNameController.dispose();
    _lastNameController.removeListener(onListen);
    _lastNameController.dispose();
    _relFirstController.removeListener(onListen);
    _relFirstController.dispose();
    _relLastController.removeListener(onListen);
    _relLastController.dispose();
  }

  void onListen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Family Members'),
        centerTitle: true,
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
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'AC No',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: Constants.fontRegular,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        FormFieldWidget(
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          isPrefixIcon: false,
                          isSuffixIcon: false,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Booth No',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: Constants.fontRegular,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        FormFieldWidget(
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          isPrefixIcon: false,
                          isSuffixIcon: false,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Serial No',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: Constants.fontRegular,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        FormFieldWidget(
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          isPrefixIcon: false,
                          isSuffixIcon: false,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   width: size.width,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       // const Text(
              //       //   'AC number',
              //       //   style: TextStyle(
              //       //     color: Colors.black,
              //       //     fontWeight: FontWeight.w500,
              //       //     fontSize: Constants.fontRegular,
              //       //   ),
              //       // ),
              //       // const SizedBox(height: 10.0),
              //       // FormFieldWidget(
              //       //   keyboardType: TextInputType.number,
              //       //   maxLength: 4,
              //       //   isPrefixIcon: false,
              //       //   isSuffixIcon: false,
              //       //   onChanged: (value) {},
              //       // ),
              //       // const SizedBox(height: 10.0),
              //       // const Text(
              //       //   'Booth number',
              //       //   style: TextStyle(
              //       //     color: Colors.black,
              //       //     fontWeight: FontWeight.w500,
              //       //     fontSize: Constants.fontRegular,
              //       //   ),
              //       // ),
              //       // const SizedBox(height: 10.0),
              //       // FormFieldWidget(
              //       //   keyboardType: TextInputType.number,
              //       //   maxLength: 4,
              //       //   isPrefixIcon: false,
              //       //   isSuffixIcon: false,
              //       //   onChanged: (value) {},
              //       // ),
              //       // const SizedBox(height: 10.0),
              //       // const Text(
              //       //   'Serial number',
              //       //   style: TextStyle(
              //       //     color: Colors.black,
              //       //     fontWeight: FontWeight.w500,
              //       //     fontSize: Constants.fontRegular,
              //       //   ),
              //       // ),
              //       // const SizedBox(height: 10.0),
              //       // FormFieldWidget(
              //       //   keyboardType: TextInputType.number,
              //       //   maxLength: 4,
              //       //   isPrefixIcon: false,
              //       //   isSuffixIcon: false,
              //       //   onChanged: (value) {},
              //       // ),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 10.0),
              orDivider(),
              const SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Voter number', // rmu1136746
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: Constants.fontRegular,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  FormFieldWidget(
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.characters,
                    inputFormatters: [
                      UpperCaseTextFormatter(),
                      FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]"))
                    ],
                    maxLength: 10,
                    isPrefixIcon: false,
                    isSuffixIcon: false,
                    onChanged: (value) {},
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              orDivider(borderColor: Colors.black38),
              const SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'First name',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: Constants.fontRegular,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            FormFieldWidget(
                              keyboardType: TextInputType.name,
                              autofillHints: const [AutofillHints.name],
                              textCapitalization: TextCapitalization.words,
                              isPrefixIcon: false,
                              isSuffixIcon: false,
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Last name',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: Constants.fontRegular,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            FormFieldWidget(
                              keyboardType: TextInputType.name,
                              autofillHints: const [AutofillHints.familyName],
                              textCapitalization: TextCapitalization.words,
                              isPrefixIcon: false,
                              isSuffixIcon: false,
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Relation first name',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: Constants.fontRegular,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            FormFieldWidget(
                              keyboardType: TextInputType.name,
                              autofillHints: const [AutofillHints.familyName],
                              textCapitalization: TextCapitalization.words,
                              isPrefixIcon: false,
                              isSuffixIcon: false,
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Relation last name',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: Constants.fontRegular,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            FormFieldWidget(
                              keyboardType: TextInputType.name,
                              autofillHints: const [AutofillHints.familyName],
                              textCapitalization: TextCapitalization.words,
                              isPrefixIcon: false,
                              isSuffixIcon: false,
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              MaterialButtonWidget(
                size: size,
                widget: const Text(
                  'Search',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ],
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
