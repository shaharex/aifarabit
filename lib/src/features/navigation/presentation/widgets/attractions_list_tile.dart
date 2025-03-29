import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jihc_hack/src/core/constants/api_key.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/core/widgets/custom_button.dart';
import 'package:jihc_hack/src/features/ai_farabi/presentation/pages/chat_page.dart';
import 'package:jihc_hack/src/features/navigation/data/models/tourism.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AttractionsListTile extends StatefulWidget {
  const AttractionsListTile({super.key, required this.attraction});

  final Attraction attraction;

  @override
  _AttractionsListTileState createState() => _AttractionsListTileState();
}

class _AttractionsListTileState extends State<AttractionsListTile> {
  String? imageUrl;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCachedImage();
  }

  Future<void> _loadCachedImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedImage = prefs.getString(widget.attraction.name);
    
    print("this is Image from sharedPref: $cachedImage");
    if (cachedImage != null) {
      setState(() {
        imageUrl = cachedImage;
        isLoading = false;
      });
    } else {
      _fetchImage(widget.attraction.name); 
    }
  }

  Future<void> _fetchImage(String query) async {
    const String accessKey = ApiKey.unsplashApiKey;
    final String query = widget.attraction.name;

    try {
      final response = await Dio().get(
        "https://api.unsplash.com/search/photos",
        queryParameters: {
          "query": query,
          "client_id": accessKey,
          "per_page": 1,
        },
      );

      if (response.statusCode == 200 && response.data['results'].isNotEmpty) {
        String fetchedImageUrl = response.data['results'][0]['urls']['regular'];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(widget.attraction.name, fetchedImageUrl);

        setState(() {
          imageUrl = fetchedImageUrl;
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
      }
    } catch (e) {
      print("Error fetching image: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(232, 237, 237, 237),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade300,
            ),
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: AppColors.iconsColor,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.grey,
                      ),
                    ),
                  )
                : imageUrl != null
                    ? CachedNetworkImage(
                        imageUrl: imageUrl!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: AppColors.iconsColor,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.grey,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.image_not_supported, size: 50),
                      )
                    : Image.asset('assets/hotel.jpg', fit: BoxFit.cover),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  widget.attraction.name,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.iconsColor,
                    fontSize: 22,
                  ),
                ),
              ),
               Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.black, size: 16),
                    Text(widget.attraction.latitude.toString(), style: TextStyle(fontSize: 16)),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          CustomButton(
            text: 'Learn more',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    latLng: LatLng(widget.attraction.latitude,
                        widget.attraction.longitude),
                    place: widget.attraction.name,
                    destination: widget.attraction.name,
                  ),
                ),
              );
            },
            textColor: Colors.white,
            btnColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
