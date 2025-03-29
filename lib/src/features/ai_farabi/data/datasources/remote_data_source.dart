import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:ai_farabi/src/core/constants/api_key.dart';
import 'package:ai_farabi/src/features/ai_farabi/data/models/message_model.dart';

class RemoteDataSource {
  RemoteDataSource();

  final Uri _uri = Uri.parse('https://api.openai.com/v1/chat/completions');
  final apiKey = ApiKey.gptApiKey;

  Future<MessageModel> sendMessage(String message) async {
    try {
      final response = await http.post(
        _uri,
        headers: {
          "Authorization": "Bearer $apiKey",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "temperature": 0.2,
          "model": "gpt-4o-mini",
          "messages": [
            {
              "role": "system",
              "content":
                  "Вас зовут AI Farabi. Вы — опытный историк и мастер рассказов. Когда вас спрашивают о местах, событиях или исторических личностях, отвечайте в богатом, захватывающем стиле, как если бы вы изучали древние тексты и слышали рассказы очевидцев. Описывайте события с живыми деталями и историческим контекстом. Ответь смотря на каком языке был задан вопрос."
            },
            {
              "role": "user",
              "content": "$message."
            }
          ],
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
