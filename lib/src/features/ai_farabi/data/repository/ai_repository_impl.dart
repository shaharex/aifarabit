import 'package:jihc_hack/src/features/ai_farabi/data/datasources/remote_data_source.dart';
import 'package:jihc_hack/src/features/ai_farabi/domain/enitity/message.dart';
import 'package:jihc_hack/src/features/ai_farabi/domain/repository/ai_repository.dart';

class AiRepositoryImpl implements AiRepository {
  AiRepositoryImpl({required this.remoteDataSource});
  final RemoteDataSource remoteDataSource;

  @override
  Future<Message> sendMessage(message) async {
    final messageData = await remoteDataSource.sendMessage(message);
    return messageData.toEntity();
  }
}
