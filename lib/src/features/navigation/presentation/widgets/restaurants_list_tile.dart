import 'package:ai_farabi/src/core/constants/api_key.dart';
import 'package:ai_farabi/src/core/widgets/custom_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ai_farabi/src/core/constants/app_colors.dart';
import 'package:ai_farabi/src/features/ai_farabi/presentation/pages/chat_page.dart';
import 'package:ai_farabi/src/features/navigation/data/models/tourism.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantListTile extends StatefulWidget {
  const RestaurantListTile({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  _RestaurantListTileState createState() => _RestaurantListTileState();
}

class _RestaurantListTileState extends State<RestaurantListTile> {
  String? imageUrl;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCachedImage();
  }

  Future<void> _loadCachedImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedImage = prefs.getString(widget.restaurant.name);

    print("this is Image from sharedPref: $cachedImage");
    if (cachedImage != null) {
      setState(() {
        imageUrl = cachedImage;
        isLoading = false;
      });
    } else {
      _fetchImage(widget.restaurant.name);
    }
  }

  Future<void> _fetchImage(String query) async {
    const String accessKey = ApiKey.unsplashApiKey;
    final String query = widget.restaurant.name;

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
        await prefs.setString(widget.restaurant.name, fetchedImageUrl);

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: 150,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade300,
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                isLoading
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
                        : Image.asset(
                            'assets/restaurant.jpg',
                            fit: BoxFit.cover,
                          ),
                Container(
                    child: Text(
                  widget.restaurant.type,
                  style: TextStyle(color: Colors.white),
                ))
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.restaurant.name,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.iconsColor,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Cost:',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('${widget.restaurant.price}\$',
                              style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Text('Address:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Text('${widget.restaurant.address}\$',
                              style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Learn more',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(
                          latLng: LatLng(
                            widget.restaurant.latitude,
                            widget.restaurant.longitude,
                          ),
                          place: widget.restaurant.name,
                          destination: widget.restaurant.name,
                        ),
                      ),
                    );
                  },
                  textColor: Colors.white,
                  btnColor: Colors.black,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
