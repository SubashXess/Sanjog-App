import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              child: Container(
                color: Colors.grey.shade200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                // height: 100,
                                // width: 100,
                                color: Colors.blue,
                                child: Row(
                                  children: [
                                    Text('data'),
                                    SizedBox(width: 10.0),
                                    Expanded(
                                      child: Text(
                                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text('New line'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
