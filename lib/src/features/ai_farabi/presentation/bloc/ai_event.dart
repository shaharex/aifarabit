part of 'ai_bloc.dart';

sealed class AiEvent extends Equatable {
  const AiEvent();

  @override
  List<Object?> get props => [];
}

class SendMessage extends AiEvent {
  final Message message;

  const SendMessage(this.message);

  @override
  List<Object?> get props => [message];
}
