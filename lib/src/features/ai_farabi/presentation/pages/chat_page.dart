import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jihc_hack/src/core/constants/constants.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Map<dynamic, dynamic>> listMessages = [
    {'message': 'Я Андрей?', 'user': true},
    {'message': 'Привет! Чем могу помочь?'},
  ];

  final TextEditingController _chatController = TextEditingController();
  bool iconShow = false;
  DateTime datetime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffD3D1D8).withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 23,
                          offset: const Offset(3, 5),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 26,
                    ),
                  ),
                  Text(
                    "AI Farabi",
                    style: TextStyle(
                      color: AppColors.chatTextColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.more_horiz_outlined,
                    color: AppColors.iconsColor,
                    size: 40,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: listMessages.length,
                itemBuilder: (context, index) {
                  final messageInfo = listMessages[index];
                  if (messageInfo.containsKey('user')) {
                    return buildUserMessage(messageInfo);
                  } else {
                    return buildGPTMessage(messageInfo, index);
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: TextField(
          style: TextStyle(color: AppColors.chatTextColor),
          controller: _chatController,
          onChanged: (value) {
            if (value.isEmpty) {
              setState(() {
                iconShow = false;
              });
            } else {
              setState(() {
                iconShow = true;
              });
            }
          },
          decoration: InputDecoration(
            fillColor: const Color(0xffFFFFFF),
            filled: true,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xff494949)),
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE1E1E1), width: 1),
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
            ),
            hintText: 'Send a message...',
            hintStyle: TextStyle(color: AppColors.iconsColor, fontSize: 16),
            suffixIcon: IconButton(
              onPressed: iconShow
                  ? () {
                      if (_chatController.text.isNotEmpty) {
                        _chatController.clear();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Вы ничего не ввели')));
                      }
                    }
                  : null,
              icon: Icon(
                Icons.send_rounded,
                color:
                    iconShow ? AppColors.chatTextColor : AppColors.iconsColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildGPTMessage(Map<dynamic, dynamic> messageInfo, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      decoration: const BoxDecoration(color: Color(0xffF7F7F8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.chatTextColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.diversity_2,
              size: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  messageInfo['message'],
                  style:
                      TextStyle(color: AppColors.chatTextColor, fontSize: 20),
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
                                  Clipboard.setData(ClipboardData(
                                      text: messageInfo["message"]));
                                },
                                icon: Icon(
                                  Icons.copy,
                                  color: AppColors.iconsColor,
                                  size: 25,
                                ),
                              ),
                              const SizedBox(width: 5),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share_rounded,
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

  Container buildUserMessage(Map<dynamic, dynamic> messageInfo) {
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
                  '/astronavt.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  messageInfo['message'],
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
