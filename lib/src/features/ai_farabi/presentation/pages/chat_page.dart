import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jihc_hack/src/core/constants/constants.dart';
import 'package:jihc_hack/src/core/widgets/custom_app_bar.dart';
import 'package:jihc_hack/src/features/ai_farabi/data/datasources/remote_data_source.dart';
import 'package:jihc_hack/src/features/ai_farabi/data/repository/ai_repository_impl.dart';
import 'package:jihc_hack/src/features/ai_farabi/domain/enitity/message.dart';
import 'package:jihc_hack/src/features/ai_farabi/domain/usecases/send_message.dart';
import 'package:jihc_hack/src/features/ai_farabi/presentation/bloc/ai_bloc.dart';
import 'package:jihc_hack/src/features/ai_farabi/presentation/widgets/input_field.dart';
import 'package:jihc_hack/src/features/ai_farabi/presentation/widgets/widgets.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.place, required this.destination});
  final String place;
  final String destination;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AiBloc(
        SendMessageUseCase(
          AiRepositoryImpl(
            remoteDataSource: RemoteDataSource(apiKey: ApiKey.apiKey),
          ),
        ),
      ),
      child: ChatView(
        place: place,
        destination: destination,
      ),
    );
  }
}

class ChatView extends StatefulWidget {
  const ChatView({super.key, required this.place, required this.destination});
  final String place;
  final String destination;

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
            CustomAppBar(
              text: widget.place,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<AiBloc, AiState>(
                builder: (context, state) {
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
                    return const Center(
                        child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.black,
                    ));
                  }

                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final message = state.messages[index];

                      if (message.role == 'assistant') {
                        return AiMessage(
                          message: message.content,
                          index: index,
                          destination: widget.destination,
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
}
