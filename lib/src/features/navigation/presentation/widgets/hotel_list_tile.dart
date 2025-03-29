import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ai_farabi/src/core/constants/app_colors.dart';
import 'package:ai_farabi/src/features/ai_farabi/presentation/pages/chat_page.dart';
import 'package:ai_farabi/src/features/navigation/data/models/tourism.dart';

class HotelListTile extends StatelessWidget {
  const HotelListTile({
    super.key,
    required this.hotel,
  });
  
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                latLng: LatLng(hotel.longitude, hotel.latitude),
                place: hotel.name,
                destination: hotel.address,
              ),
            ));
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        width: 150,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade300,
              ),
              child: Image.asset(
                'assets/hotel.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text(
                    hotel.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.iconsColor,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    hotel.price.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: AppColors.iconsColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
