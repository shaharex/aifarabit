import 'dart:convert';
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
            {"role": "user", "content": message}
          ],
          "model": "llama-3.3-70b-versatile"
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['choices'] is List && data['choices'].isNotEmpty) {
          final messageContent = data['choices'][0]['message'];
          print(MessageModel.fromJson(messageContent));
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
