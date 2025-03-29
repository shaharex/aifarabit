import 'package:flutter/material.dart';
import 'package:ai_farabi/src/core/constants/app_colors.dart';
import 'package:ai_farabi/src/core/widgets/widgets.dart';

class CityItem extends StatelessWidget {
  const CityItem({
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.imagePath,
    super.key,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 125,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              height: 125,
              width: 125,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 7),
                  RichText(
                    maxLines: 2,
                    text: TextSpan(
                      text: subtitle,
                      style: TextStyle(
                        color: Colors.black.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    text: 'Choose City',
                    onTap: onTap,
                    textColor: Colors.white,
                    btnColor: AppColors.iconsColor,
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
