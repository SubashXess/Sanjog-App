// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: 'loksabha', child: Text('Loksabha')),
      const DropdownMenuItem(value: 'assembly', child: Text('Assembly')),
      const DropdownMenuItem(value: 'block', child: Text('Block')),
      const DropdownMenuItem(value: 'mandal', child: Text('Mandal')),
      const DropdownMenuItem(value: 'gp/ulb_unit', child: Text('GP/ULB Unit')),
      const DropdownMenuItem(value: 'booth', child: Text('Booth')),
      const DropdownMenuItem(value: 'guest', child: Text('Guest')),
    ];
    return menuItems;
  }

  String defaultValue = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: DropdownButton<String>(
          value: defaultValue,
          isDense: true,
          isExpanded: true,
          menuMaxHeight: size.height / 2,
          items: dropdownItems,
          onChanged: (value) {
            setState(() {
              defaultValue = value!;
            });
          },
        ),
      ),
    );
  }
}
