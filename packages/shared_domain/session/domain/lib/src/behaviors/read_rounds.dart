import 'package:session_domain/src/entities/round.br.dart';
import 'package:session_domain/src/repositories/history_repository.dart';

/// Every round finished this session, newest first.
class ReadRounds {
  final HistoryRepository _repository;

  const ReadRounds({required HistoryRepository history}) : _repository = history;

  List<Round> call() => _repository.read();
}
