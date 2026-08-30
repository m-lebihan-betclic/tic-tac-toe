/// How a finished game ended, from the human player's side.
///
/// A mid-game reset is none of these. It ends no game, so it produces no `Round` and moves no
/// score.
enum GameOutcome { drawn, lost, won }
