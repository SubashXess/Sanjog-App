import 'package:flutter/material.dart';

class VoterDetailsCard extends StatelessWidget {
  const VoterDetailsCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Column(
        children: [
          SizedBox(
            width: size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Section No: 1",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Total Voters: 30",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.014),
          SizedBox(
            width: size.width,
            child: Card(
              margin: EdgeInsets.zero,
              color: Colors.white,
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
                      Row(
                        // crossAxisAlignment: WrapCrossAlignment.center,
                        // direction: Axis.horizontal,
                        // alignment: WrapAlignment.spaceBetween,
                        // runSpacing: 10.0,
                        // spacing: 10.0,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'AcNo: 111',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: size.width * 0.012),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.red,
                            ),
                            child: const Text(
                              'Booth No: 1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
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
                              color: Colors.red,
                            ),
                            child: const Text(
                              'Page No: 3',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
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
                              color: Colors.red,
                            ),
                            child: const Text(
                              'Serial No: 1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
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
                              color: Colors.red.shade50,
                              border: Border.all(color: Colors.red, width: 1.0),
                            ),
                            child: const Text(
                              '1',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.036),
                          const Text(
                            'YXV0934471',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(width: size.width * 0.036),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.red,
                            ),
                            child: const Text(
                              'PP',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
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
                              'Name: Subash Xess',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Sex: F',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Category: General',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Relation Type: H',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Relation Name: Subash Xess',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Mobile No: 9337856231',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Whatsapp No: 9438749228',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.012),
                      MaterialButton(
                        onPressed: () {},
                        color: Colors.red,
                        height: size.height * 0.04,
                        minWidth: size.width * 0.3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        child: const Text(
                          'Add Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
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
                          color: Colors.red.shade400,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              side: BorderSide(
                                  color: Colors.red.shade300, width: 1.0)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.asset(
                            'assets/demo-girl.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.012),
                      Row(
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.white,
                            height: size.height * 0.04,
                            minWidth: size.width * 0.3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                side: BorderSide(
                                    width: 1.0, color: Colors.grey.shade300)),
                            child: const Text(
                              'Choose file',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.036),
                          const Text(
                            'No file chosen',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.012),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Add Family Details:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: size.width * 0.04),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {},
                            child: Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.amber.shade800,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 24.0,
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.04),
                          const Text(
                            'Family Details',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14.0,
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
}
