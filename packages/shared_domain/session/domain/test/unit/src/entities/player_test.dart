import 'package:givn/givn.dart';
import 'package:session_domain/session_domain.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  given('a nickname longer than the cap', (_) => 'Bartholomew the Third')
      .when('a player is created from it', (sut, _) => Player.create(sut))
      .then('it is cut to twelve characters',
          (result, _) => result.getOrNull()!.name.should.be('Bartholomew '));

  given('a nickname padded with spaces', (_) => '   Morgan   ')
      .when('a player is created from it', (sut, _) => Player.create(sut))
      .then('the padding is gone', (result, _) => result.getOrNull()!.name.should.be('Morgan'));

  given('a nickname that is nothing but spaces', (_) => '     ')
      .when('a player is created from it', (sut, _) => Player.create(sut))
      .then('it is refused rather than accepted as empty', (result, _) {
        result.exceptionOrNull().should.be(PlayerError.empty);
        result.getOrNull().should.beNull();
      });
}
