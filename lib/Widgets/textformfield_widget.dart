import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.size,
    required this.controller,
    required this.hintText,
    required this.textInputType,
    required this.onChanged,
    required this.validator,
  });
  final Size size;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType textInputType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(6.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(6.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade600),
              borderRadius: BorderRadius.circular(6.0)),
        ),
        maxLines: 1,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
