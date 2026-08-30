import 'package:session_domain/src/entities/round.br.dart';

/// What has been played this session. The "how" lives in the data layer.
///
/// [read] returns newest first, which is the order the history screen renders and the only order
/// anything asks for. A mid-game reset finishes no game, so it appends nothing.
abstract interface class HistoryRepository {
  List<Round> read();

  void write(Round round);
}
