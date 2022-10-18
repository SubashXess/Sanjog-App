// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sonjagapp/Constants/constants.dart';
import 'package:sonjagapp/Models/user_data_model.dart';

class VoterListScreen extends StatefulWidget {
  const VoterListScreen({super.key});

  @override
  State<VoterListScreen> createState() => _VoterListScreenState();
}

class _VoterListScreenState extends State<VoterListScreen> {
  // models
  List<UserDataModel> userData = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 10.0, left: 10.0, top: 16.0, bottom: 6.0),
                child: Column(
                  children: [
                    _buildVoterCard(size),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVoterCard(Size size) {
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    onTap: () {
                      print('Change photo');
                    },
                    child: Card(
                      margin: EdgeInsets.zero,
                      color: Colors.grey.shade200,
                      elevation: 0.0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      child: const Center(
                        child: Text('Image'),
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
                    const Text(
                      'Raj Kumar',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.fontMedium,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    _buildRowItems(label: 'DOB:', labelData: '10-Jan-1998'),
                    const SizedBox(height: 4.0),
                    _buildRowItems(label: 'Sex:', labelData: 'Male'),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        const Text(
                          'YXV0934471',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Constants.fontRegular,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Card(
                          margin: EdgeInsets.zero,
                          elevation: 0.0,
                          color:
                              Constants.kSecondaryThemeColor.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 2.0),
                            child: Text(
                              'PP',
                              textAlign: TextAlign.center,
                              style: TextStyle(
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
                const SizedBox(height: 4.0),
                const Text(
                  'Patrapada, Bhubaneswar 751003',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: Constants.fontRegular,
                  ),
                ),
                const SizedBox(height: 16.0),
                Wrap(
                  alignment: WrapAlignment.start,
                  runSpacing: 10.0,
                  spacing: 10.0,
                  children: [
                    _buildItems(label: 'Category:', labelData: 'General'),
                    _buildItems(label: 'Relation Type:', labelData: 'H'),
                    _buildItems(
                        label: 'Relation Name:', labelData: 'John Carmack'),
                    _buildItems(
                        label: 'Mobile No:', labelData: '+91 12345 67890'),
                    _buildItems(
                        label: 'Whatsapp No:', labelData: '+91 12345 67890'),
                  ],
                ),
              ],
            ),
          ),

          // const Text(
          //     'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
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
}
