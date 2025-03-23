import 'package:flutter/material.dart';

class PreferencesChip extends StatelessWidget {
  const PreferencesChip({
    super.key,
    required this.text,
    required this.preferences,
    required this.onTap,
  });

  final String text;
  final bool preferences;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.5, vertical: 2.5),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: preferences ? Colors.black : const Color(0xffEBE9E9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: preferences ? Colors.white : const Color(0xffA0A0A5),
          ),
        ),
      ),
    );
  }
}
