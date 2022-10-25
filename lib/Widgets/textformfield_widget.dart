import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Constants/constants.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    super.key,
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
    this.isSuffixIcon = true,
    this.suffixText,
    this.inputFormatters,
    this.readOnly = false,
    this.onTap,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.autovalidateMode,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
  });

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
  final String? suffixText;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final VoidCallback? onTap;
  final TextAlign? textAlign;
  final int? maxLines;
  final AutovalidateMode? autovalidateMode;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText!,
        focusNode: focusNode,
        autofocus: autofocus!,
        autovalidateMode: autovalidateMode,
        readOnly: readOnly!,
        decoration: InputDecoration(
          isDense: false,
          labelText: label,
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: contentPadding,
          hintStyle: const TextStyle(
              color: Colors.black45,
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
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(color: Colors.red.shade400, width: 1.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(color: Colors.red.shade400, width: 1.0)),
          suffixText: suffixText,
          suffixStyle: const TextStyle(
              color: Constants.kPrimaryThemeColor,
              fontSize: Constants.fontRegular,
              fontWeight: FontWeight.bold),
          prefixIcon: isPrefixIcon!
              ? Icon(
                  prefixIcon,
                  color: Constants.kPrimaryThemeColor,
                  size: 20.0,
                )
              : null,
          suffixIcon: isSuffixIcon! ? suffixIcon : null,
        ),
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        maxLines: maxLines,
        keyboardType: keyboardType,
        cursorColor: Constants.kPrimaryThemeColor,
        autofillHints: autofillHints,
        textCapitalization: textCapitalization!,
        textAlign: textAlign!,
        validator: validator,
        onChanged: onChanged,
        onTap: onTap,
      ),
    );
  }
}
