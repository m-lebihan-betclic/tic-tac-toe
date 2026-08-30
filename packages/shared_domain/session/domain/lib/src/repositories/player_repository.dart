import 'package:session_domain/src/entities/player.dart';

/// Who is playing. The "how" lives in the data layer.
///
/// Null means nobody has been set up yet, which is what sends the app to the setup sheet.
abstract interface class PlayerRepository {
  Player? read();

  void write(Player player);
}
