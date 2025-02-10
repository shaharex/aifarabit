import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jihc_hack/src/features/ai_farabi/domain/enitity/message.dart';
import 'package:jihc_hack/src/features/ai_farabi/domain/usecases/send_message.dart';

part 'ai_event.dart';
part 'ai_state.dart';

class AiBloc extends Bloc<AiEvent, AiState> {
  final SendMessageUseCase sendMessageUseCase;

  AiBloc(this.sendMessageUseCase) : super(AiInitialState()) {
    on<SendMessage>(_sendMessage);
  }

  _sendMessage(SendMessage event, Emitter<AiState> emit) async {
    final updatedMessages = List<Message>.from(state.messages)
      ..add(event.message);

    emit(AiGeneratingState(updatedMessages));

    try {
      final aiResponse =
          await sendMessageUseCase.execute(event.message.content);
      updatedMessages.add(aiResponse);
      emit(AiSuccessState(updatedMessages));
    } catch (e) {
      emit(AiFailureState("Error: $e", updatedMessages));
    }
  }
}
