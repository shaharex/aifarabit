import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/features/map/presentation/page/map_page.dart';

class AiMessage extends StatelessWidget {
  const AiMessage({
    super.key,
    required this.message,
    required this.index,
    required this.destination,
  });

  final String message;
  final int index;
  final String destination;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      decoration: const BoxDecoration(color: Colors.black),
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
            // child: const Icon(
            //   Icons.diversity_2,
            //   size: 20,
            //   color: Colors.black,
            // ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  message,
                  style:
                      TextStyle(color: AppColors.iconsColor, fontSize: 20),
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
                                      builder: (context) => MapPickPage(),
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
}
