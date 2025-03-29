import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ai_farabi/src/core/widgets/custom_button.dart';

class HeadLineWidget extends StatelessWidget {
  const HeadLineWidget({
    super.key,
    this.icon,
    required this.text,
    required this.btnText,
    required this.onTap,
    required this.imagePath,
  });

  final IconData? icon;
  final String text;
  final String btnText;
  final VoidCallback onTap;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 3),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (icon != null)
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon!,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                Text(
                  text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CustomButton(
                  text: btnText,
                  onTap: onTap,
                  height: 30,
                  textColor: icon == null ? Colors.white : Colors.black,
                  btnColor: icon == null ? Colors.black : Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
