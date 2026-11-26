import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_reservation_app/validators.dart';

void main() {
  group('validateName', () {
    test('returns error when name is empty', () {
      expect(validateName(''), 'Please enter your name');
    });

    test('returns error when name has fewer than 3 characters', () {
      expect(
        validateName('Al'),
        'Name must have at least 3 characters',
      );
    });

    test('returns null when name is valid', () {
      expect(validateName('Alex'), null);
    });
  });

  group('validateEmail', () {
    test('returns error when email is empty', () {
      expect(validateEmail(''), 'Please enter your email');
    });

    test('returns error when email format is invalid', () {
      expect(
        validateEmail('alexexample.com'),
        'Enter a valid email address',
      );
    });

    test('returns null when email is valid', () {
      expect(validateEmail('alex@example.com'), null);
    });
  });

  group('validatePhone', () {
    test('returns error when phone number is empty', () {
      expect(
        validatePhone(''),
        'Please enter your phone number',
      );
    });

    test('returns error when phone number is invalid', () {
      expect(
        validatePhone('12345'),
        'Use 10 or 11 digits, numbers only',
      );
    });

    test('returns null when phone number has 10 digits', () {
      expect(validatePhone('0123456789'), null);
    });

    test('returns null when phone number has 11 digits', () {
      expect(validatePhone('01234567890'), null);
    });
  });

  group('validateCheckIn', () {
    test('returns error when date is not selected', () {
      expect(
        validateCheckIn(null),
        'Choose a check-in date',
      );
    });

    test('returns null when date is selected', () {
      expect(validateCheckIn(DateTime(2026, 12, 1)), null);
    });
  });

  group('validateAgreement', () {
    test('returns error when policy is not accepted', () {
      expect(
        validateAgreement(false),
        'Please accept the hotel policy',
      );
    });

    test('returns null when policy is accepted', () {
      expect(validateAgreement(true), null);
    });
  });
}
