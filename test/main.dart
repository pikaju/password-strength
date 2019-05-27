import 'package:test/test.dart';
import 'package:password_strength/password_strength.dart';

void main() {
  test('Kek is equal to 0.5', () {
    expect(kek(), equals(0.5));
  });
}
