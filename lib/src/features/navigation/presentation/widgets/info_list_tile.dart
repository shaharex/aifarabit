import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/features/ai_farabi/presentation/pages/chat_page.dart';

class InfoListTile extends StatelessWidget {
  const InfoListTile({
    super.key,
    required this.placeName,
    required this.placeDescription,
    required this.placeDestination,
    required this.placeIcon, required this.latLng,
  });
  final String placeName;
  final String placeDescription;
  final String placeDestination;
  final IconData placeIcon;
  final LatLng latLng;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                latLng: latLng,
                place: placeName,
                destination: placeDestination,
              ),
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: 150,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              placeIcon,
              size: 40,
              color: AppColors.iconsColor,
            ),
            Text(
              placeName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.iconsColor,
                fontSize: 20,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              placeDescription,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: AppColors.iconsColor,
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
              child: Icon(
                Icons.arrow_forward_rounded,
                color: AppColors.primaryColor,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
