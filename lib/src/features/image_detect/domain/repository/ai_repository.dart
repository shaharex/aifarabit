import 'package:ai_farabi/src/features/ai_farabi/domain/enitity/message.dart';

abstract class AiRepository {
  Future<Message> sendMessage(message);
}
