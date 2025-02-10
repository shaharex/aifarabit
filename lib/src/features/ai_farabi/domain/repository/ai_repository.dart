import 'package:jihc_hack/src/features/ai_farabi/domain/enitity/message.dart';

abstract class AiRepository {
  Future<Message> sendMessage(message);
}
