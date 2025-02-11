import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.textColor,
    required this.btnColor,
    this.borderRadius,
  });

  final String text;
  final VoidCallback onTap;
  final Color textColor;
  final Color btnColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 15),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
    );
  }
}
