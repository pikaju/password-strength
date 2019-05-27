# Password Strength Estimator

A basic password strength estimator for Dart. Considers the length of the password, used characters,
and whether or not the password appears in the top 10,000 most used passwords.

## Usage

```dart
import 'package:password_strength/password_strength.dart';

...

double strength = estimatePasswordStrength('passw0rd');

if (strength < 0.3)
  print('This password is weak!');
```