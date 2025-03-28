import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ai_farabi/src/core/constants/app_colors.dart';
import 'package:ai_farabi/src/core/widgets/custom_app_bar.dart';
import 'package:ai_farabi/src/features/ai_farabi/data/datasources/remote_data_source.dart';
import 'package:ai_farabi/src/features/ai_farabi/data/repository/ai_repository_impl.dart';
import 'package:ai_farabi/src/features/ai_farabi/domain/enitity/message.dart';
import 'package:ai_farabi/src/features/ai_farabi/domain/usecases/send_message.dart';
import 'package:ai_farabi/src/features/ai_farabi/presentation/bloc/ai_bloc.dart';
import 'package:ai_farabi/src/features/ai_farabi/presentation/widgets/input_field.dart';
import 'package:ai_farabi/src/features/ai_farabi/presentation/widgets/widgets.dart';
import 'package:lottie/lottie.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.place, required this.destination, required this.latLng});
  final String place;
  final String destination;
  final LatLng latLng;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AiBloc(
        SendMessageUseCase(
          AiRepositoryImpl(
            remoteDataSource: RemoteDataSource(),
          ),
        ),
      )..add(SendMessage(Message(
          content: 'Tell me about $place.',
          role: 'user'))),
      child: ChatView(
        place: place,
        destination: destination,
        latLng: latLng,
      ),
    );
  }
}

class ChatView extends StatefulWidget {
  const ChatView({super.key, required this.place, required this.destination, required this.latLng});
  final String place;
  final String destination;
  final LatLng latLng;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _chatController = TextEditingController();
  bool iconShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Platform.isIOS ? const SizedBox(height: 35) : const SizedBox(),
            CustomAppBar(
              text: widget.place,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<AiBloc, AiState>(
                builder: (context, state) {
                  if (state.messages.isNotEmpty) {
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => _scrollToBottom());
                  }
                  if (state.messages.isEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.diversity_2,
                          size: 70,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "AI Farabi",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.chatTextColor,
                          ),
                        ),
                        Text(
                          "Ask me anything",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: AppColors.chatTextColor,
                          ),
                        ),
                      ],
                    );
                  }
                  if (state is AiGeneratingState) {
                    return Center(
                        child: CircularProgressIndicator.adaptive(
                      backgroundColor: AppColors.iconsColor,
                    ));
                  }

                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: state.messages.length + 1,
                    itemBuilder: (context, index) {
                      if (index == state.messages.length) {
                        if (state is Thinking) {
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor
                            ),
                            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('assets/logo.png', width: 35, height: 35,),
                              Lottie.asset('assets/animations/thinking.json', width: 36, height: 36)
                            ],
                          ),
                          );
                        } else {
                          return SizedBox();
                        }
                      }

                      final message = state.messages[index];

                      if (message.role == 'assistant') {
                        return AiMessage(
                          message: message.content,
                          index: index,
                          destination: widget.destination,
                          latLng: widget.latLng,
                        );
                      } else {
                        return UserMessage(message: message.content);
                      }
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButton: InputField(
        hintText: 'Send a message...',
        controller: _chatController,
        onPressed: () {
          if (_chatController.text.isNotEmpty) {
            setState(() {
              context.read<AiBloc>().add(SendMessage(
                  Message(content: _chatController.text, role: 'user')));
            });
            _chatController.clear();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Вы ничего не ввели')));
          }
        },
        textChanged: (value) {
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
        iconShow: iconShow,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}
