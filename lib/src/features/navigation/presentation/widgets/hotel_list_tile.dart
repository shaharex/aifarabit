import 'package:ai_farabi/src/core/constants/api_key.dart';
import 'package:ai_farabi/src/core/constants/app_colors.dart';
import 'package:ai_farabi/src/core/widgets/custom_button.dart';
import 'package:ai_farabi/src/features/ai_farabi/presentation/pages/chat_page.dart';
import 'package:ai_farabi/src/features/navigation/data/models/tourism.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HotelListTile extends StatefulWidget {
  const HotelListTile({super.key, required this.hotel});

  final Hotel hotel;

  @override
  _HotelListTileState createState() => _HotelListTileState();
}

class _HotelListTileState extends State<HotelListTile> {
  String? imageUrl;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCachedImage();
  }

  Future<void> _loadCachedImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedImage = prefs.getString(widget.hotel.name);

    print("this is Image from sharedPref: $cachedImage");
    if (cachedImage != null) {
      setState(() {
        imageUrl = cachedImage;
        isLoading = false;
      });
    } else {
      _fetchImage(widget.hotel.name);
    }
  }

  Future<void> _fetchImage(String query) async {
    const String accessKey = ApiKey.unsplashApiKey;
    final String query = widget.hotel.name;

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
        await prefs.setString(widget.hotel.name, fetchedImageUrl);

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
            height: 150,
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
                  widget.hotel.name,
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
                    Text(' ${widget.hotel.rating}', style: const TextStyle(fontSize: 16)),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price'),
              Text("\$ ${widget.hotel.price}"),
              Text("${widget.hotel.rating}"),
            ],
          ),
          Text(widget.hotel.address),
          const SizedBox(height: 10),
          CustomButton(
            text: 'Learn more',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    latLng: LatLng(
                      widget.hotel.latitude,
                      widget.hotel.longitude,
                    ),
                    place: widget.hotel.name,
                    destination: widget.hotel.name,
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
