import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget({
    Key? key,
    required this.size,
    required this.widget,
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final Widget widget;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.red,
      disabledColor: Colors.red.shade200,
      minWidth: size.width,
      height: size.height * 0.06,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      child: widget,
    );
  }
}

class ElevatedIconButtonWidget extends StatelessWidget {
  const ElevatedIconButtonWidget({
    Key? key,
    required this.size,
    this.iconPadding,
    required this.icon,
    required this.label,
    required this.textDirection,
  }) : super(key: key);

  final Size size;
  final EdgeInsetsGeometry? iconPadding;
  final IconData icon;
  final String label;
  final TextDirection textDirection;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Directionality(
        textDirection: textDirection,
        child: ElevatedButton.icon(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0)),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
                side: BorderSide(color: Colors.grey.shade300, width: 1.0))),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {},
          icon: Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green.shade600,
            ),
            child: Icon(
              // Icons.arrow_back_ios,
              icon,
              size: 16.0,
            ),
          ),
          label: Text(
            label.toString(),
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );
  }
}
