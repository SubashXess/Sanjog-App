// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sonjagapp/Providers/add_to_family_members_provider.dart';

import '../Components/gradients.dart';
import '../Constants/constants.dart';

class SeeFamilyMembers extends StatefulWidget {
  const SeeFamilyMembers({super.key});

  @override
  State<SeeFamilyMembers> createState() => _SeeFamilyMembersState();
}

class _SeeFamilyMembersState extends State<SeeFamilyMembers> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final addedFamily = Provider.of<AddToFamilyProvider>(context);
    print('reload');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Family Members',
          style: TextStyle(
            color: Colors.white,
            fontSize: Constants.fontLarge,
            fontWeight: FontWeight.w600,
          ),
        ),
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
          _buildVoterList(addedFamily),
        ],
      ),
    );
  }

  Widget _buildVoterList(AddToFamilyProvider addedFamily) {
    Size size = MediaQuery.of(context).size;
    print(addedFamily.selectedMember);
    print('child');
    return ListView.separated(
      itemCount: addedFamily.selectedMember.length,
      shrinkWrap: true,
      controller: scrollController,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return SizedBox(
          width: size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 82.0,
                width: size.width / 4.6,
                child: Card(
                  margin: EdgeInsets.zero,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  color: Colors.grey.shade200,
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
                    Text(
                      'Saroj Das $index',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.fontRegular,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    _buildRowItems(label: 'DOB:', labelData: '10-03-2000'),
                    const SizedBox(height: 6.0),
                    _buildRowItems(label: 'Voter ID:', labelData: 'OXP1234567'),
                    const SizedBox(height: 6.0),
                    _buildRowItems(
                        label: 'Aadhar No', labelData: '1234 5678 4534'),
                    const SizedBox(height: 6.0),
                    _buildRowItems(
                        label: 'Mobile No', labelData: '+91 1234567890'),
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple.shade100,
                  ),
                  child: Icon(
                    Icons.edit_rounded,
                    size: 14.0,
                    color: Colors.deepPurple.shade700,
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Consumer<AddToFamilyProvider>(builder: (context, value, child) {
                return InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    value.removeMembers(value.selectedMember[index]);
                  },
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red.shade100,
                    ),
                    child: Icon(
                      Icons.delete_rounded,
                      size: 14.0,
                      color: Colors.red.shade700,
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(height: 20.0),
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
            fontSize: Constants.fontExtraSmall,
          ),
        ),
        const SizedBox(width: 4.0),
        Expanded(
          child: Text(
            labelData.toString(),
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: Constants.fontExtraSmall,
            ),
          ),
        ),
      ],
    );
  }
}
