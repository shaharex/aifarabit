import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String content;
  final String role;

  const Message({
    required this.content,
    required this.role,
  });

  @override
  List<Object?> get props => [content, role];
}
