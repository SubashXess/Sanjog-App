import 'package:flutter/material.dart';
import 'package:sonjagapp/Components/gradients.dart';
import 'package:sonjagapp/Constants/constants.dart';

class AddFamilyMemberListScreen extends StatefulWidget {
  const AddFamilyMemberListScreen({super.key});

  @override
  State<AddFamilyMemberListScreen> createState() =>
      _AddFamilyMemberListScreenState();
}

class _AddFamilyMemberListScreenState extends State<AddFamilyMemberListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
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
                                      label: 'Voter ID:',
                                      labelData: 'OXP1234567'),
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
              ),
            ],
          ),
        ),
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
}
