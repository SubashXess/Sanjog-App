import 'package:flutter/material.dart';

import '../Components/gradients.dart';
import '../Constants/constants.dart';

class SeeFamilyMembers extends StatefulWidget {
  const SeeFamilyMembers({super.key});

  @override
  State<SeeFamilyMembers> createState() => _SeeFamilyMembersState();
}

class _SeeFamilyMembersState extends State<SeeFamilyMembers> {
  ScrollController scrollController = ScrollController();
  bool _isLongPressed = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Details'),
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
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        shrinkWrap: true,
        controller: scrollController,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(10.0),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

        children: [
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
              return Card(
                margin: EdgeInsets.only(bottom: _isLongPressed ? 10.0 : 0.0),
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
                      margin:
                          EdgeInsets.only(bottom: _isLongPressed ? 0.0 : 10.0),
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
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                    backgroundColor: MaterialStateProperty.all(
                                        Constants.kLightThemeColor),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            horizontal: 6.0, vertical: 0.0)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.0))),
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
                                        color: Constants.kPrimaryThemeColor),
                                  ),
                                ),
                                const SizedBox(width: 36.0),
                                TextButton.icon(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        // Constants.kLightThemeColor,
                                        Colors.green.shade50),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            horizontal: 6.0, vertical: 0.0)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.0))),
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
            },
          ),
        ],
      ),
    );
  }
}
