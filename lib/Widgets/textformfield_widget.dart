import 'package:flutter/material.dart';

import '../Constants/constants.dart';

// class TextFormFieldWidget extends StatelessWidget {
//   const TextFormFieldWidget({
//     super.key,
//     required this.size,
//     required this.controller,
//     required this.hintText,
//     required this.textInputType,
//     required this.onChanged,
//     this.validator,
//   });
//   final Size size;
//   final TextEditingController? controller;
//   final String? hintText;
//   final TextInputType textInputType;
//   final Function(String)? onChanged;
//   final String? Function(String?)? validator;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: size.width,
//       child: TextFormField(
//         controller: controller,
//         keyboardType: textInputType,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         decoration: InputDecoration(
//           isDense: true,
//           hintText: hintText,
//           border: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.grey.shade400),
//               borderRadius: BorderRadius.circular(6.0)),
//           enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.grey.shade400),
//               borderRadius: BorderRadius.circular(6.0)),
//           focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.grey.shade600),
//               borderRadius: BorderRadius.circular(6.0)),
//         ),
//         maxLines: 1,
//         onChanged: onChanged,
//         validator: validator,
//       ),
//     );
//   }
// }

// class TextFieldWidget extends StatelessWidget {
//   const TextFieldWidget({
//     Key? key,
//     required this.size,
//     required this.controller,
//     required this.keyboardType,
//     required this.maxLength,
//     required this.onChanged,
//     required this.label,
//     this.validator,
//   }) : super(key: key);

//   final Size size;
//   final String label;
//   final TextEditingController controller;
//   final TextInputType keyboardType;
//   final int maxLength;
//   final Function(String) onChanged;
//   final String? Function(String?)? validator;

//   @override
//   Widget build(BuildContext context) {
//     return
//     SizedBox(
//       width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label.toString(),
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: Constants.fontRegular,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           SizedBox(height: size.height * 0.012),
//           SizedBox(
//             // height: size.height * 0.056,
//             child: TextFormField(
//               controller: controller,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 isDense: true,
//                 counterText: '',
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(6.0),
//                     borderSide: BorderSide.none),
//               ),
//               keyboardType: keyboardType,
//               maxLength: maxLength,
//               maxLines: 1,
//               onChanged: onChanged,
//               validator: validator,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget(
      {super.key,
      this.label,
      this.hintText,
      this.obscureText = false,
      this.controller,
      this.autofocus = false,
      this.focusNode,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.onChanged,
      this.keyboardType = TextInputType.text,
      this.autofillHints,
      this.maxLength = 40,
      this.textCapitalization = TextCapitalization.none,
      this.inputBorder,
      this.isPrefixIcon = true,
      this.isSuffixIcon = true});

  final String? label;
  final String? hintText;
  final bool? obscureText;
  final TextEditingController? controller;
  final bool? autofocus;
  final FocusNode? focusNode;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final BoxBorder? inputBorder;
  final bool? isPrefixIcon, isSuffixIcon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText!,
        focusNode: focusNode,
        autofocus: autofocus!,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          isDense: true,
          labelText: label,
          hintText: hintText,
          filled: true,
          fillColor: Constants.kLightThemeColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          hintStyle: TextStyle(
              color: Constants.kSecondaryThemeColor.withOpacity(0.6),
              fontSize: Constants.fontRegular,
              fontWeight: FontWeight.w500),
          labelStyle: TextStyle(
              color: Constants.kSecondaryThemeColor.withOpacity(0.8),
              fontSize: Constants.fontRegular,
              fontWeight: FontWeight.normal),
          floatingLabelStyle: const TextStyle(
              fontSize: Constants.fontLarge,
              color: Constants.kSecondaryThemeColor),
          errorStyle: const TextStyle(
              color: Colors.red,
              fontSize: Constants.fontSmall,
              fontWeight: FontWeight.normal),
          errorMaxLines: 2,
          counterText: '',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide.none),
          prefixIcon: isPrefixIcon!
              ? Icon(
                  prefixIcon,
                  color: Constants.kPrimaryThemeColor,
                  size: 20.0,
                )
              : null,
          suffixIcon: isSuffixIcon! ? suffixIcon : null,
        ),
        maxLength: maxLength,
        keyboardType: keyboardType,
        cursorColor: Constants.kPrimaryThemeColor,
        autofillHints: autofillHints,
        textCapitalization: textCapitalization!,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
