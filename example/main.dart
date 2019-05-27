import 'dart:io';
import 'package:password_strength/password_strength.dart';

void main() {
  // Read a password from stdin.
  print('Please enter a password:');
  final password = stdin.readLineSync();

  // Estimate the password's strength.
  double strength = estimatePasswordStrength(password);

  // Print a response
  if (strength < 0.3) {
    print('This password is weak!');
  } else if (strength < 0.7) {
    print('This password is alright.');
  } else {
    print('This passsword is strong!');
  }
}
