import 'package:flutter/material.dart';
import 'package:jihc_hack/src/core/constants/constants.dart';

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
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffD3D1D8).withOpacity(0.3),
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
          ),
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
