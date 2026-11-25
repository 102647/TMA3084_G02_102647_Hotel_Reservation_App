import 'package:flutter/material.dart';
import 'booking_form_page.dart';

void main() {
  runApp(const HotelReservationApp());
}

class HotelReservationApp extends StatelessWidget {
  const HotelReservationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green Haven Hotel',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF789477),
          brightness: Brightness.light,
        ),

        scaffoldBackgroundColor: const Color(0xFFF5F4EA),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE5EBDD),
          foregroundColor: Color(0xFF344638),
          centerTitle: true,
          elevation: 0,
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xFFCAD7C5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xFF789477),
              width: 2,
            ),
          ),
        ),
      ),

      home: const BookingFormPage(),
    );
  }
}
