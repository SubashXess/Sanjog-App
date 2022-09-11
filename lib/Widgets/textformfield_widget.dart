import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.size,
    required this.controller,
    required this.hintText,
    required this.textInputType,
    required this.onChanged,
    this.validator,
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

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.size,
    required this.controller,
    required this.keyboardType,
    required this.maxLength,
    required this.onChanged,
    required this.label,
  }) : super(key: key);

  final Size size;
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLength;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: size.height * 0.012),
          SizedBox(
            // height: size.height * 0.056,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.red.shade100,
                isDense: true,
                counterText: '',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide.none),
              ),
              keyboardType: keyboardType,
              maxLength: maxLength,
              maxLines: 1,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
