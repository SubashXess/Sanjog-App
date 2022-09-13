import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sonjagapp/Constants/constants.dart';

class VoterDetailsCard extends StatefulWidget {
  const VoterDetailsCard({
    Key? key,
    required this.size,
    required this.serialNo, required this.acNo, required this.boothNo, required this.pageNo,
  }) : super(key: key);

  final Size size;
  final String acNo;
  final String boothNo;
  final String pageNo;
  final String serialNo;

  @override
  State<VoterDetailsCard> createState() => _VoterDetailsCardState();
}

class _VoterDetailsCardState extends State<VoterDetailsCard> {
  // Image add
  File? image;
  String? loadImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      child: Column(
        children: [
          SizedBox(
            width: widget.size.width,
            child: Card(
              margin: EdgeInsets.zero,
              color: Colors.white,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
                side: BorderSide(color: Colors.grey.shade400, width: 1.0),
              ),
              child: SizedBox(
                width: widget.size.width,
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
                          SizedBox(width: widget.size.width * 0.012),
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
                          SizedBox(width: widget.size.width * 0.012),
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
                          SizedBox(width: widget.size.width * 0.012),
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
                      SizedBox(height: widget.size.height * 0.012),
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
                            child: const Text(
                              '1',
                              style: TextStyle(
                                color: Constants.kPrimaryThemeColor,
                                fontSize: Constants.fontSmall,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: widget.size.width * 0.036),
                          const Text(
                            'YXV0934471',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: Constants.fontSmall,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(width: widget.size.width * 0.036),
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
                      SizedBox(height: widget.size.height * 0.012),
                      SizedBox(
                        width: widget.size.width,
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
                      SizedBox(height: widget.size.height * 0.012),
                      MaterialButton(
                        onPressed: () {},
                        color: Constants.kPrimaryThemeColor,
                        height: widget.size.height * 0.04,
                        minWidth: widget.size.width * 0.3,
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
                      SizedBox(height: widget.size.height * 0.012),
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
                      SizedBox(height: widget.size.height * 0.012),
                      Row(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              pickImage(ImageSource.gallery, context);
                            },
                            color: Colors.white,
                            height: widget.size.height * 0.04,
                            minWidth: widget.size.width * 0.3,
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
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                          SizedBox(width: widget.size.width * 0.036),
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
                      SizedBox(height: widget.size.height * 0.012),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Add Family Details:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: Constants.fontSmall,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: widget.size.width * 0.04),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {},
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
                          SizedBox(width: widget.size.width * 0.04),
                          const Text(
                            'Family Details',
                            style: TextStyle(
                              color: Constants.kSecondaryThemeColor,
                              fontSize: Constants.fontSmall,
                              fontWeight: FontWeight.normal,
                            ),
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

        // ignore: avoid_print
        print("Load Image : $loadImage");
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
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
