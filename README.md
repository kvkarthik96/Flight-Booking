# Flight Booking Flutter App

This repository contains a Flutter application for flight booking. The app allows users to search for flights, view matching flights, and book their desired flights based on search criteria. This app also allows users to play against each other. The game is a classic tic-tac-toe game and includes the ability to save the user's progress using shared preferences.

## Features

- Search for flights by origin, destination, and date.
- View a list of matching flights.
- Book flights seamlessly.

- Play a simple tic-tac-toe game against another player.
- Save and load game progress using shared preferences.


## Getting Started

Follow these steps to get the app up and running on your local machine.

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/kvkarthik96/Flight-Booking.git
   ```

2. Navigate to the project directory:

   ```bash
   cd FlightBookingApp
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

### Usage

Run the app on an emulator or a connected device:

```bash
flutter run
```

### JSON Payload Sample

Here's an example of the JSON payload structure for flight data:

```json
[
   {
      "flight_img": "image_path",
      "flight_name": "Indigo",
      "flight_from": "Bengaluru",
      "flight_to": "Chennai",
      "flight_from_date": "2023-08-27",
      "flight_to_date": "2023-08-27",
      "flight_from_time": "10:15",
      "flight_to_time": "11:15",
      "flight_duration": "01 h",
      "flight_stops": "Non stop",
      "flight_fare": "2800"
    },
    {
      "flight_img": "image_path",
      "flight_name": "King Fisher",
      "flight_from": "Bengaluru",
      "flight_to": "Chennai",
      "flight_from_date": "2023-08-27",
      "flight_to_date": "2023-08-27",
      "flight_from_time": "8:15",
      "flight_to_time": "9:15",
      "flight_duration": "01 h",
      "flight_stops": "Non stop",
      "flight_fare": "2700"
    }
]
```

### How to Play

- Launch the app and start a new game.
- Players take turns marking empty cells with 'X' or 'O'.
- The first player to get three of their marks in a row, column, or diagonal wins.
- The game ends in a draw if all cells are filled and no player has won.

### How to Use
1. Launch the app and you'll land on the home screen.
2. Use the search functionality to specify your flight criteria: origin, destination, and date.
3. Tap the "Search" button to see a list of available flights that match your search.
4. Choose a flight from the list to view more details.
5. Book a flight by following the booking process.