import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/core/constants/constants.dart';
import 'package:jihc_hack/src/core/widgets/custom_app_bar.dart';
import 'package:jihc_hack/src/features/ai_farabi/data/datasources/remote_data_source.dart';
import 'package:jihc_hack/src/features/ai_farabi/data/models/message_model.dart';
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
      )..add(SendMessage(
          Message(content: 'расскажи мне о $place кратко максимум 50 слов', role: 'user'))),
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

  late Future<MessageModel> futureMessage;

  @override
  void initState() {
    super.initState();

    // futureMessage = RemoteDataSource(apiKey: ApiKey.apiKey)
    //     .sendMessage('расскажи мне о ${widget.place} кратко максимум 50 слов');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
              children: [
              // FutureBuilder<MessageModel>(
              //   future: futureMessage,
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return CircularProgressIndicator(); 
              //     } else if (snapshot.hasError) {
              //       return Text("Ошибка: ${snapshot.error}");
              //     } else if (snapshot.hasData) {
              //       return Text(snapshot.data!.content); 
              //     } else {
              //       return Text("Нет данных");
              //     }
              //   },
              // ),
                SizedBox(height: 30,),
                CustomAppBar(
                  text: widget.place,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: BlocBuilder<AiBloc, AiState>(
                    builder: (context, state) {
                      if (state.messages.isNotEmpty) {
                        WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
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
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 100,
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      // borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Center(
                                      child: CircularProgressIndicator.adaptive(backgroundColor: AppColors.iconsColor,),
                                    ),
                                  )
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
