import 'package:flutter/material.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 40,
        height: 40,
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: AppColors.iconsColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffFFE6A6).withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 23,
              offset: const Offset(3, 5),
            ),
          ],
        ),
        child: const Icon(
          Icons.arrow_back_ios,
          size: 26,
        ),
      ),
    );
  }
}
