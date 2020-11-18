import 'dart:math';

/// Estimates the strength of a password against a brute force attack.
/// The passwords length as well as the characters use are taken into
/// consideration.
double estimateBruteforceStrength(String password) {
  if (password.isEmpty) return 0.0;

  // Check which types of characters are used and create an opinionated bonus.
  double charsetBonus;
  if (RegExp(r'^[0-9]*$').hasMatch(password)) {
    charsetBonus = 0.8;
  } else if (RegExp(r'^[a-z]*$').hasMatch(password)) {
    charsetBonus = 1.0;
  } else if (RegExp(r'^[a-z0-9]*$').hasMatch(password)) {
    charsetBonus = 1.2;
  } else if (RegExp(r'^[a-zA-Z]*$').hasMatch(password)) {
    charsetBonus = 1.3;
  } else if (RegExp(r'^[a-z\-_!?]*$').hasMatch(password)) {
    charsetBonus = 1.3;
  } else if (RegExp(r'^[a-zA-Z0-9]*$').hasMatch(password)) {
    charsetBonus = 1.5;
  } else {
    charsetBonus = 1.8;
  }

  final logisticFunction = (double x) {
    return 1.0 / (1.0 + exp(-x));
  };

  final curve = (double x) {
    return logisticFunction((x / 3.0) - 4.0);
  };

  return curve(password.length * charsetBonus);
}
