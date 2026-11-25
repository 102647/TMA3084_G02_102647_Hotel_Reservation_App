class RoomType {
  final String name;
  final String description;
  final int capacity;
  final double pricePerNight;

  const RoomType({
    required this.name,
    required this.description,
    required this.capacity,
    required this.pricePerNight,
  });
}

const List<RoomType> availableRooms = [
  RoomType(
    name: 'Single Room',
    description: 'A cosy room for one guest.',
    capacity: 1,
    pricePerNight: 150.00,
  ),
  RoomType(
    name: 'Double Room',
    description: 'A comfortable room with a double bed.',
    capacity: 2,
    pricePerNight: 250.00,
  ),
  RoomType(
    name: 'Family Room',
    description: 'A spacious room suitable for families.',
    capacity: 5,
    pricePerNight: 400.00,
  ),
];
