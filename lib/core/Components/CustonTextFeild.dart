import 'package:flutter/material.dart';

import '../../core/themes/AppColors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? icon;
  final Color? iconColor;
  final Color? borderColor;
  final double? heightBtn;
  final double? widthBtn;
  final int? maxLine;
  final TextInputType? keyboardType; // New parameter for keyboard type
  final bool? readOnly;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool? obscureText;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.heightBtn,
    this.icon,
    this.iconColor,
    this.borderColor,
    this.validator,
    this.maxLine,
    this.keyboardType,
    this.readOnly,
    this.onTap,
    this.onChanged,
    this.suffixIcon,
    this.obscureText,
    this.widthBtn, // Added keyboardType parameter
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthBtn,
      child: TextFormField(
        obscureText: obscureText ?? false,
        onChanged: onChanged,
        onTap: onTap ?? () {},
        controller: controller,
        readOnly: readOnly ?? false,
        decoration: InputDecoration(
          labelText: hintText,
          prefixIcon: icon,
          suffixIcon: suffixIcon,
          contentPadding:
              EdgeInsets.symmetric(vertical: heightBtn!, horizontal: 10),
          // Adjust vertical padding
          filled: true,
          fillColor: AppColor.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 0,
              color: AppColor.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 0,
              color: AppColor.white,
            ),
          ),
        ),
        validator: validator,
        keyboardType: keyboardType,
      ),
    );
  }
}
