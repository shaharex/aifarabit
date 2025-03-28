import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/features/ai_farabi/presentation/pages/chat_page.dart';
import 'package:jihc_hack/src/features/navigation/data/models/tourism.dart';

class RestaurantsListTile extends StatelessWidget {
  const RestaurantsListTile({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                latLng: LatLng(restaurant.latitude, restaurant.longitude),
                place: restaurant.name,
                destination: restaurant.address,
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
                'assets/food.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text(
                    restaurant.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.iconsColor,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    restaurant.address,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.iconsColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amberAccent,
                      ),
                      Text(restaurant.rating.toString())
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
