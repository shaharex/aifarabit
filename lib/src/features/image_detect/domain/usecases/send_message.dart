import 'package:ai_farabi/src/features/ai_farabi/domain/enitity/message.dart';
import 'package:ai_farabi/src/features/ai_farabi/domain/repository/ai_repository.dart';

class SendMessageUseCase {
  const SendMessageUseCase(this.aiRepository);
  final AiRepository aiRepository;

  Future<Message> execute(message) async {
    return await aiRepository.sendMessage(message);
  }
}
