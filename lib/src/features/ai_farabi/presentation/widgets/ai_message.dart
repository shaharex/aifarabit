import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ai_farabi/src/core/constants/app_colors.dart';
import 'package:ai_farabi/src/features/map/presentation/page/map_page.dart';

// ignore: must_be_immutable
class AiMessage extends StatelessWidget {
  AiMessage({
    super.key,
    required this.message,
    required this.index,
    required this.destination,
    required this.latLng,
  });

  final String message;
  final int index;
  final String destination;
  final LatLng latLng;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      decoration: BoxDecoration(color: AppColors.primaryColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('assets/logo.png'),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  message,
                  style: TextStyle(color: AppColors.iconsColor, fontSize: 20),
                ),
                const SizedBox(height: 10),
                index != 0
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(40)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Clipboard.setData(
                                    ClipboardData(
                                      text: message,
                                    ),
                                  );
                                  showCopyOverlay(context);
                                },
                                icon: Icon(
                                  Icons.copy,
                                  color: AppColors.iconsColor,
                                  size: 25,
                                ),
                              ),
                              const SizedBox(width: 5),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MapPickPage(latLng: latLng),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.map,
                                  color: AppColors.iconsColor,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  OverlayEntry? overlayEntry;

  void showCopyOverlay(BuildContext context) {
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 65,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3,
                )
              ],
            ),
            child: const Text(
              "Сообщение успешно скопировано",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
    Future.delayed(const Duration(seconds: 1), () => removeOverlay());
  }

  void removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }
}
