import 'package:test/test.dart';
import 'package:password_strength/password_strength.dart';

void main() {
  group('Bruteforcable passwords get a low estimate', () {
    final passwords = [
      '',
      '4',
      'I',
      '3l',
      'WY',
      'suj',
      'nRR',
      'jk2O',
      'TcIT',
      'keklel',
      'test12',
      'A_#2',
    ];
    passwords.forEach((String password) {
      test('"$password" is a weak password', () {
        expect(estimatePasswordStrength(password), lessThan(0.2));
      });
    });
  });

  group('Very common passwords get a low estimate', () {
    final passwords = [
      '123456',
      'password',
      'cookie',
      'delilah',
      'president',
      '31011987',
      'masterp',
      'shady',
      'brady',
      'alexis',
      'passw0rd',
      'pikachu',
    ];
    passwords.forEach((String password) {
      test('"$password" is a weak password', () {
        expect(estimatePasswordStrength(password), lessThan(0.2));
      });
    });
  });

  group('Secure random passwords get a high estimate', () {
    final passwords = [
      'IhA6rCt2YlOWH',
      '9wm034xE5tlCxs8',
      'aZOanh8tJN6wEjwTW',
      'EQcN89CYHQkdivgtpb',
      'fShXdncLQa74G6V9cS6X',
      'yIS4XEFNvgQBPVTozaCb',
      'HIAmBvaFU5SeFYCYlJIyFNJ4O24x',
      'vlk6H6zILSlJ7ctr821E9niCptJpzGXOFoShCAxc',
    ];
    passwords.forEach((String password) {
      test('"$password" is a strong password', () {
        expect(estimatePasswordStrength(password), greaterThan(0.8));
      });
    });
  });
}
