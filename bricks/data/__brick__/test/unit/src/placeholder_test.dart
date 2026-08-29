import 'package:givn/givn.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  given('a placeholder test for {{name.snakeCase()}}', (context) => true)
      .when('the package is tested', (sut, context) => sut)
      .then('it should pass', (result, context) => result.should.beTrue());
}
