import 'package:flutter/material.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.textChanged,
    this.onObscure,
    this.isObscure,
    required this.prefixIcon,
  });

  final String hintText;
  final TextEditingController controller;
  Function(String)? textChanged;
  void Function()? onObscure;
  final bool? isObscure;
  final Icon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: AppColors.chatTextColor),
      controller: controller,
      onChanged: textChanged,
      obscureText: isObscure ?? false,
      decoration: InputDecoration(
        fillColor: const Color(0xffFFFFFF),
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0xff494949)),
          borderRadius: BorderRadius.all(
            Radius.circular(13),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffFFFFFF), width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(13),
          ),
        ),
        suffixIcon: isObscure == null
            ? null
            : IconButton(
                onPressed: onObscure,
                icon: const Icon(Icons.remove_red_eye_outlined)),
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.iconsColor, fontSize: 16),
      ),
    );
  }
}
