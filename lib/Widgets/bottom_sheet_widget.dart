import 'package:flutter/material.dart';
import 'package:sonjagapp/Constants/constants.dart';

class IOSModalStyle extends StatelessWidget {
  const IOSModalStyle(
      {super.key, required this.childBody, required this.headerTop});

  final Widget childBody;
  final Widget headerTop;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        margin: EdgeInsets.only(
            top: 10.0,
            right: 10.0,
            left: 10.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10.0),
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // _dividerWidget(size),

            const Text(
              'Search Family Members',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Constants.fontLarge,
                  fontWeight: FontWeight.bold),
            ),
            headerTop,
            Container(
              decoration: const BoxDecoration(
                color: Colors.white, // color of card
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
              ),
              height: 200, // body container height
              width: double.infinity,
              child: childBody,
            )
          ],
        ),
      ),
    );
  }
}
