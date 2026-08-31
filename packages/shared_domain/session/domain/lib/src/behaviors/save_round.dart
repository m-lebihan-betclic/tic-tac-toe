import 'package:session_domain/src/entities/round.br.dart';
import 'package:session_domain/src/repositories/history_repository.dart';

/// Records a finished round.
///
/// Only a finished one. A mid-game reset ends no round, so it saves nothing — which is what keeps
/// a reset from counting as a loss.
class SaveRound {
  final HistoryRepository _repository;

  const SaveRound({required HistoryRepository history}) : _repository = history;

  void call(Round round) => _repository.write(round);
}
