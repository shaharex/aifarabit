import 'package:flutter/material.dart';
import 'package:jihc_hack/src/features/ai_farabi/presentation/pages/chat_page.dart';

class InfoListTile extends StatelessWidget {
  const InfoListTile({
    super.key,
    required this.placeName,
    required this.placeDescription,
    required this.placeIcon,
  });
  final String placeName;
  final String placeDescription;
  final IconData placeIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(place: placeName,),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: 150,
        decoration: BoxDecoration(
          color: const Color(0xffF7F7F8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              placeIcon,
              size: 40,
            ),
            Text(
              placeName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              placeDescription,
              style: const TextStyle(
                  color: Color(0xffA0A0A5),
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffA0A0A5),
              ),
              child: const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
