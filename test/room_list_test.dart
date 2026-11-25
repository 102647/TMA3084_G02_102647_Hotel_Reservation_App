import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_reservation_app/room_list_page.dart';

void main() {
  testWidgets('Room list displays all available rooms',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1400, 1200);
    tester.view.devicePixelRatio = 1;

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        home: RoomListPage(
          guests: 2,
          checkIn: DateTime(2026, 12, 1),
          preferredRoom: 'Double Room',
        ),
      ),
    );

    expect(find.text('Choose Your Room'), findsOneWidget);
    expect(find.text('Available Rooms'), findsOneWidget);
    expect(find.text('Single Room'), findsOneWidget);
    expect(find.text('Double Room'), findsOneWidget);
    expect(find.text('Family Room'), findsOneWidget);
    expect(find.text('Preferred'), findsOneWidget);
  });

  testWidgets('Back button returns to previous screen',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1400, 1200);
    tester.view.devicePixelRatio = 1;

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RoomListPage(
                      guests: 2,
                      checkIn: null,
                      preferredRoom: 'Double Room',
                    ),
                  ),
                );
              },
              child: const Text('Open Rooms'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open Rooms'));
    await tester.pumpAndSettle();

    expect(find.text('Choose Your Room'), findsOneWidget);

    await tester.tap(find.text('Back to Booking Form'));
    await tester.pumpAndSettle();

    expect(find.text('Open Rooms'), findsOneWidget);
  });
}
