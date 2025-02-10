import 'package:flutter/widgets.dart';
import 'package:jihc_hack/src/core/constants/constants.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 35,
                height: 35,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 24, 41, 33),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  'assets/astronavt.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  message,
                  style:
                      TextStyle(color: AppColors.chatTextColor, fontSize: 20),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
