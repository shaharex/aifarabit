import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:jihc_hack/src/core/constants/constants.dart';
import 'package:jihc_hack/src/features/ai_farabi/data/models/message_model.dart';

class RemoteDataSource {
  RemoteDataSource({required this.apiKey});

  final Uri _uri = Uri.parse('https://api.groq.com/openai/v1/chat/completions');
  final String apiKey;

  Future<MessageModel> sendMessage(String message) async {
    try {
      final response = await http.post(
        _uri,
        headers: {
          ApiHeaderKeys.authorization: ApiHeaderValues.bearer(apiKey),
          ApiHeaderKeys.contentType: ApiHeaderValues.applicationJson,
        },
        body: jsonEncode({
          "messages": [
            {
              "role": "system",
              "content":
                  "Вы — опытный историк и мастер рассказов. Когда вас спрашивают о местах, событиях или исторических личностях, отвечайте в богатом, захватывающем стиле, как если бы вы изучали древние тексты и слышали рассказы очевидцев. Описывайте события с живыми деталями и историческим контекстом. Ответь только на русском языке."
            },
            {
              "role": "user",
              "content": "$message. Отвечай только на русском языке."
            }
          ],
          "model": "llama-3.3-70b-versatile"
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        log(data.toString());
        if (data['choices'] is List && data['choices'].isNotEmpty) {
          final messageContent = data['choices'][0]['message'];
          return MessageModel.fromJson(messageContent);
        }
        throw Exception('Invalid API response format');
      } else {
        throw Exception('Failed to send message: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
