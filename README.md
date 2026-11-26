# Green Haven Hotel — Hotel Reservation App

![Flutter CI](https://github.com/102647/TMA3084_G02_102647_Hotel_Reservation_App/actions/workflows/ci.yml/badge.svg)

A Flutter-based hotel reservation prototype developed for TMA3084 Software Engineering Laboratory, Lab 06 Lesson 08.

# Project Overview

Green Haven Hotel is a simple hotel reservation application that allows guests to enter their booking details, validate their information, and explore available room options.

# Features

- Guest name validation
- Email address validation
- Phone number validation
- Check-in date selection
- Guest quantity selection
- Room preference selection
- Optional breakfast selection
- Hotel policy agreement
- Available room listing with descriptions, capacities, and prices
- Preferred room highlighting

# Screens

1. Booking Form — Guests enter their personal and booking information.
2. Choose Your Room — Guests view the available room options and their details.

# Technologies Used

- Flutter
- Dart
- Visual Studio Code
- GitHub
- GitHub Actions

# Testing

The project includes:

- Unit tests for input validation
- Widget tests for the booking form
- Acceptance criteria tests for REQ-12
- Room list widget tests

# Run the Application

```bash
flutter pub get
flutter run -d chrome
```

# Run Tests

```bash
flutter analyze
flutter test
flutter test --coverage
```

# Test Coverage

**Current Test Coverage: 93.49%**

The project exceeds the minimum required test coverage of 60%.

# Continuous Integration (CI)

GitHub Actions is configured to automatically:

- Install Flutter dependencies
- Analyze the project
- Run automated tests with coverage
- Upload the coverage report as a GitHub Actions artifact named `coverage-report`

# Repository

GitHub: https://github.com/102647/TMA3084_G02_102647_Hotel_Reservation_App

# Course Information

- Course: TMA3084 Software Engineering Laboratory
- Lab:Lab 06 — Hotel Reservation App
- Project: Green Haven Hotel — Hotel Reservation App