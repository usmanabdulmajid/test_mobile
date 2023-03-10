import 'package:flutter/material.dart';
import 'package:test_mobile/core/core.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  const CustomTextField({
    Key? key,
    required this.label,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColor.waterloo,
            fontWeight: FontWeight.w500,
          ),
        ),
        const YMargin(ksmallSpace),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: kspace),
            hintText: hintText,
            hintStyle: const TextStyle(color: AppColor.mischka),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kTinyBorderRadius),
              borderSide: const BorderSide(color: AppColor.iron),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kTinyBorderRadius),
              borderSide: const BorderSide(color: AppColor.iron),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kTinyBorderRadius),
              borderSide: const BorderSide(color: Colors.red),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kTinyBorderRadius),
              borderSide: const BorderSide(color: Colors.red),
            ),
            //border: InputBorder.none,
          ),
        )
      ],
    );
  }
}
