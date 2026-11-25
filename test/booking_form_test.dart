import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_reservation_app/main.dart';

void main() {
  Future<void> openBookingForm(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1400, 1400);
    tester.view.devicePixelRatio = 1;

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const HotelReservationApp());
  }

  testWidgets('AC1 - Empty form displays four validation errors',
      (WidgetTester tester) async {
    await openBookingForm(tester);

    await tester.ensureVisible(find.byKey(const Key('reserveButton')));
    await tester.tap(find.byKey(const Key('reserveButton')));
    await tester.pumpAndSettle();

    expect(find.text('Please enter your name'), findsOneWidget);
    expect(find.text('Please enter your phone number'), findsOneWidget);
    expect(find.text('Choose a check-in date'), findsOneWidget);
    expect(find.text('Please accept the hotel policy'), findsOneWidget);
  });

  testWidgets('AC2 - Invalid phone number displays an error',
      (WidgetTester tester) async {
    await openBookingForm(tester);

    await tester.enterText(
      find.byKey(const Key('phoneField')),
      '12345',
    );

    await tester.ensureVisible(find.byKey(const Key('reserveButton')));
    await tester.tap(find.byKey(const Key('reserveButton')));
    await tester.pumpAndSettle();

    expect(
      find.text('Use 10 or 11 digits, numbers only'),
      findsOneWidget,
    );
  });

  testWidgets('AC3 - Short name displays an error',
      (WidgetTester tester) async {
    await openBookingForm(tester);

    await tester.enterText(
      find.byKey(const Key('guestNameField')),
      'Al',
    );

    await tester.ensureVisible(find.byKey(const Key('reserveButton')));
    await tester.tap(find.byKey(const Key('reserveButton')));
    await tester.pumpAndSettle();

    expect(
      find.text('Name must have at least 3 characters'),
      findsOneWidget,
    );
  });

  testWidgets('AC4 - Valid booking opens the room list',
      (WidgetTester tester) async {
    await openBookingForm(tester);

    await tester.enterText(
      find.byKey(const Key('guestNameField')),
      'Alex Tan',
    );

    await tester.enterText(
      find.byKey(const Key('phoneField')),
      '0123456789',
    );

    await tester.tap(find.byKey(const Key('checkInButton')));
    await tester.pumpAndSettle();

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('policyCheckbox')));
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.byKey(const Key('reserveButton')));
    await tester.tap(find.byKey(const Key('reserveButton')));
    await tester.pumpAndSettle();

    expect(find.text('Choose Your Room'), findsOneWidget);
    expect(find.text('Available Rooms'), findsOneWidget);
  });

  testWidgets('AC5 - Name error disappears after entering valid name',
      (WidgetTester tester) async {
    await openBookingForm(tester);

    await tester.ensureVisible(find.byKey(const Key('reserveButton')));
    await tester.tap(find.byKey(const Key('reserveButton')));
    await tester.pumpAndSettle();

    expect(find.text('Please enter your name'), findsOneWidget);

    await tester.enterText(
      find.byKey(const Key('guestNameField')),
      'Alex Tan',
    );

    await tester.pumpAndSettle();

    expect(find.text('Please enter your name'), findsNothing);
  });
}
