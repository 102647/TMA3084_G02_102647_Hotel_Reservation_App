import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_reservation_app/main.dart';

void main() {
  setUp(() {
    // Use a larger screen for booking form tests.
  });

  testWidgets('Booking screen displays correctly',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1400, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const HotelReservationApp());

    expect(find.text('Green Haven Hotel'), findsOneWidget);
    expect(find.text('Book Your Stay'), findsOneWidget);
    expect(
      find.text('Relax, unwind and enjoy your stay with us.'),
      findsOneWidget,
    );
    expect(find.text('Guest Information'), findsOneWidget);
    expect(find.text('Check-in Date'), findsOneWidget);
    expect(find.text('Number of Guests'), findsOneWidget);
    expect(find.text('Room Preference'), findsOneWidget);
    expect(find.text('Reserve'), findsOneWidget);
  });

  testWidgets('Empty booking form displays four validation errors',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1400, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const HotelReservationApp());

    final reserveButton = find.byKey(const Key('reserveButton'));

    expect(reserveButton, findsOneWidget);

    await tester.ensureVisible(reserveButton);
    await tester.tap(reserveButton);
    await tester.pumpAndSettle();

    expect(find.text('Please enter your name'), findsOneWidget);
    expect(find.text('Please enter your phone number'), findsOneWidget);
    expect(find.text('Choose a check-in date'), findsOneWidget);
    expect(find.text('Please accept the hotel policy'), findsOneWidget);
  });
}
