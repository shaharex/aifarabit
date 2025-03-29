part of 'ai_bloc.dart';

sealed class AiState extends Equatable {
  const AiState(this.messages);

  final List<Message> messages;

  @override
  List<Object?> get props => [messages];
}

class AiInitialState extends AiState {
  AiInitialState() : super([]);
}

class AiGeneratingState extends AiState {
  AiGeneratingState(List<Message> messages) : super(messages);
}
class Thinking extends AiState {
  Thinking(super.messages);
}

class AiSuccessState extends AiState {
  AiSuccessState(List<Message> messages) : super(messages);
}

class AiFailureState extends AiState {
  final String errMessage;

  const AiFailureState(this.errMessage, List<Message> messages)
      : super(messages);

  @override
  List<Object?> get props => [errMessage, messages];
}
