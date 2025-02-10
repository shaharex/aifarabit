import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jihc_hack/src/features/ai_farabi/domain/enitity/message.dart';

class MessageModel {
  final String content;
  final String role;

  MessageModel({
    required this.content,
    required this.role,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        content: json['content'],
        role: json['role'],
      );

  Message toEntity() => Message(content: content, role: role);
}
