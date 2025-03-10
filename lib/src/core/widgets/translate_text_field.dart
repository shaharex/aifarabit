import 'package:flutter/material.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';

// ignore: must_be_immutable
class TranslateTextField extends StatelessWidget {
  TranslateTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.maxLine,
  });

  final String hintText;
  final TextEditingController controller;
  int? maxLine = 1;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: AppColors.iconsColor),
      controller: controller,
      
      maxLines: maxLine,
      decoration: InputDecoration(
        fillColor: Colors.black,
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0xff494949)),
          borderRadius: BorderRadius.all(
            Radius.circular(13),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(13),
          ),
        ),
        
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.iconsColor, fontSize: 16),
      ),
    );
  }
}
