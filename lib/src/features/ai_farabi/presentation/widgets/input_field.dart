import 'package:flutter/material.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  InputField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.textChanged,
    required this.onPressed,
    required this.iconShow,
  });

  final String hintText;
  final TextEditingController controller;
  Function(String)? textChanged;
  Function()? onPressed;
  final bool iconShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextField(
        style: TextStyle(
          color: AppColors.iconsColor,
        ),
        controller: controller,
        onChanged: textChanged,
        decoration: InputDecoration(
          fillColor: AppColors.backgroundColor,
          filled: true,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Color(0xff494949)),
            borderRadius: BorderRadius.all(
              Radius.circular(13),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffE1E1E1), width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(13),
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.iconsColor, fontSize: 16),
          suffixIcon: IconButton(
            onPressed: iconShow ? onPressed : null,
            icon: Icon(
              Icons.send_rounded,
              color: iconShow ? AppColors.chatTextColor : AppColors.iconsColor,
            ),
          ),
        ),
      ),
    );
  }
}
