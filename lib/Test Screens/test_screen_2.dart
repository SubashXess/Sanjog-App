import 'package:flutter/material.dart';

class TestDateFormatted extends StatefulWidget {
  const TestDateFormatted({super.key});

  @override
  State<TestDateFormatted> createState() => _TestDateFormattedState();
}

class _TestDateFormattedState extends State<TestDateFormatted> {
  DateTime? pickedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Picked Date : $pickedDate'),
            const SizedBox(height: 10.0),
            MaterialButton(
              onPressed: () async {
                pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1970),
                  lastDate: DateTime.now(),
                );
                setState(() {});
              },
              color: Colors.deepPurple,
              child: const Text(
                'Pick Date',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
