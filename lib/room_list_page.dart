import 'package:flutter/material.dart';
import 'room_type.dart';

class RoomListPage extends StatelessWidget {
  final int guests;
  final DateTime? checkIn;
  final String preferredRoom;

  const RoomListPage({
    super.key,
    required this.guests,
    required this.checkIn,
    required this.preferredRoom,
  });

  static const Color green = Color(0xFF789477);
  static const Color darkGreen = Color(0xFF344638);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Choose Your Room',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Available Rooms',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Find a comfortable room for your stay.',
              style: TextStyle(color: darkGreen),
            ),
            const SizedBox(height: 20),

            Card(
              color: const Color(0xFFE5EBDD),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your Booking Details',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: darkGreen,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text('Guests: $guests'),
                    Text(
                      'Check-in: ${checkIn == null ? 'Not selected' : '${checkIn!.day}/${checkIn!.month}/${checkIn!.year}'}',
                    ),
                    Text('Preferred room: $preferredRoom'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            ...availableRooms.map((room) {
              final isPreferred = room.name == preferredRoom;

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: isPreferred ? green : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.bed_outlined,
                            size: 32,
                            color: green,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              room.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: darkGreen,
                              ),
                            ),
                          ),
                          if (isPreferred)
                            const Chip(
                              label: Text('Preferred'),
                              backgroundColor: Color(0xFFE5EBDD),
                            ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(room.description),
                      const SizedBox(height: 8),
                      Text('Capacity: ${room.capacity} guest(s)'),
                      const SizedBox(height: 8),
                      Text(
                        'RM ${room.pricePerNight.toStringAsFixed(2)} / night',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: green,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 12),

            OutlinedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to Booking Form'),
              style: OutlinedButton.styleFrom(
                foregroundColor: darkGreen,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
