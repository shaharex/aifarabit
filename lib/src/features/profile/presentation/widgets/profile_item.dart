import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onTap,
  });

  final String text;
  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/$iconPath.svg',
                  width: 30,
                ),
                const SizedBox(width: 15),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xffA7A7AB),
            )
          ],
        ),
      ),
    );
  }
}
