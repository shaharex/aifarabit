import 'package:flutter/material.dart';
import 'package:jihc_hack/src/core/constants/constants.dart';
import 'package:jihc_hack/src/core/widgets/custom_back_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomBackButton(),
          Text(
            "AI Farabi",
            style: TextStyle(
              color: AppColors.chatTextColor,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(
            Icons.more_horiz_outlined,
            color: AppColors.iconsColor,
            size: 40,
          ),
        ],
      ),
    );
  }
}
