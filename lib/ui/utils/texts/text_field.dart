import 'package:flutter/material.dart';
import 'package:deep_byte/res/color_const.dart';

class CustomTextField extends StatelessWidget {
  final GlobalKey<FormFieldState>? formKey;
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final bool? isReadOnly;
  final bool? enabled;
  final int? maxLines;
  final Function()? onTap;
  final void Function(String)? onChanged;
  final int? maxCharacters;
  final String? Function(String?)? validator;
  final TextAlign? textAlign;
  final bool? obscureText;
  final bool isShowLabelText = true;
  final double? borderRadius;
  final double? leftContentPadding;
  final double? fontSize;
  const CustomTextField(
      {super.key,
      this.formKey,
      this.controller,
      required this.hintText,
      this.keyboardType,
      this.focusNode,
      this.suffixIcon,
      this.prefixIcon,
      this.prefix,
      this.isReadOnly,
      this.maxCharacters,
      this.onChanged,
      this.onTap,
      this.validator,
      this.obscureText,
      this.maxLines,
      this.enabled,
      this.textAlign,
      this.fontSize,
      this.leftContentPadding,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxCharacters,
      onTap: onTap,
      enabled: enabled,
      key: formKey,
      focusNode: focusNode,
      controller: controller,
      cursorColor: kBlackColor,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      readOnly: isReadOnly ?? false,
      maxLines: maxLines ?? 1,
      validator: validator,
      textAlign: textAlign ?? TextAlign.start,
      onChanged: onChanged ??
          (text) {
            if (formKey != null) formKey!.currentState!.validate();
          },
      textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(
          color: Colors.black,
          fontSize: 13,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none),
      decoration: InputDecoration(
          counterText: "",
          labelText: hintText,
          labelStyle: const TextStyle(
              color: kTertiaryColor,
              fontSize: 14,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15),
              borderSide: BorderSide(
                  color: kPrimaryColor.withOpacity(0.5), width: 2.0)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15),
              borderSide: const BorderSide(color: kTertiaryColor, width: 1.0)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15),
              borderSide: const BorderSide(color: kTertiaryColor, width: 1.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15),
              borderSide: BorderSide(
                  color: kPrimaryColor.withOpacity(0.5), width: 1.0)),
          suffixIcon: suffixIcon,
          disabledBorder: InputBorder.none,
          hintText: hintText,
          contentPadding: EdgeInsets.only(left: leftContentPadding ?? 15),
          hintStyle: const TextStyle(
              color: kTertiaryColor,
              fontSize: 14,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none),
          errorMaxLines: 2),
    );
  }
}

class CustomSearchTextField extends StatelessWidget {
  final Function() onTap;
  const CustomSearchTextField({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextField(
        // controller: searchController,
        onTap: onTap,
        onChanged: (value) {},
        readOnly: true,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: kBlackColor),
          prefixIcon: const Icon(Icons.search, color: kBlackColor),
          hintText: 'Search Flight',
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
        ));
  }
}
