# flutter_coding_challenge

A Flutter dropdown application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Project Structure

lib/
├── bloc/
│   ├── dropdown_bloc.dart
│   ├── dropdown_event.dart
│   └── dropdown_state.dart
├── data/
│   ├── models/
│   │   ├── country.dart
│   │   └── state.dart
│   └── services/
│       └── api_service.dart
├── presentation/
│   ├── screens/
│   │   ├── dropdown_screen.dart
│   │   └── summary_screen.dart
│   └── widgets/
│       └── custom_dropdown_widget.dart
└── main.dart

test/
├── bloc/
│   ├── dropdown_bloc_test.dart
├── data/
│   └── services/
│       └── api_service_test.dart
├── presentation/
│   ├── screens/
│   │   ├── dropdown_screen_test.dart
│   └── widgets/
│       └── custom_dropdown_widget_test.dart
└── main_test.dart


## Overview

The Flutter Dropdown App is a simple application designed to demonstrate
the use of `flutter_bloc` for state management and custom dropdown widgets.
The app fetches data from a remote API, populates dropdown menus with this data,
and allows users to select a country and state. Upon selection, the chosen country
and state are displayed on a summary screen.

## Features

- Fetch countries and states from a remote API.
- Display the data in custom dropdown widgets.
- Navigate to a summary screen displaying the selected country and state.

## Architecture

The architecture of the app is organized into the following layers:

- Data Layer: Manages data fetching from the remote API.
- Bloc Layer: Manages state and business logic using the `flutter_bloc` package.
- Presentation Layer: Contains the UI components.

### Data Layer

Files:

- `lib/data/models/country.dart`
- `lib/data/models/state.dart`
- `lib/data/services/api_service.dart`

The data layer includes model classes for Country and State and
a service class `ApiService` to handle API requests.

ApiService:
- `getCountries()`: Fetches the list of countries.
- `getStates(int countryId)`: Fetches the list of states for a given country ID.

### Bloc Layer

Files:

- `lib/bloc/dropdown_bloc.dart`
- `lib/bloc/dropdown_event.dart`
- `lib/bloc/dropdown_state.dart`

The Bloc layer uses the `flutter_bloc` package to manage the state of the dropdowns.

DropdownBloc:
- Listens for `FetchCountries` and `FetchStates` events.
- Fetches data via `ApiService` and updates the state.

DropdownEvent:
- `FetchCountries`: Event to fetch the list of countries.
- `FetchStates(int countryId)`: Event to fetch the list of states for a given country ID.

DropdownState:
- Holds the current state of the dropdowns, including the list of countries,
  list of states, selected country, and selected state.

### Presentation Layer

Files:

- `lib/presentation/screens/dropdown_screen.dart`
- `lib/presentation/screens/summary_screen.dart`
- `lib/presentation/widgets/custom_dropdown_widget.dart`

The presentation layer contains the UI components and screens.

DropdownScreen:
- Displays the dropdown menus for selecting a country and state.
- Uses `BlocBuilder` to rebuild the UI based on the state of the `DropdownBloc`.

SummaryScreen:
- Displays the selected country and state.
- Receives the selected country and state as arguments from the `DropdownScreen`.

CustomDropdown:
- A reusable widget that displays a dropdown menu.

## Testing

The app includes unit and widget tests to ensure the functionality of
the various components. The tests are organized into the following files:

- `test/bloc/dropdown_bloc_test.dart`: Tests for the `DropdownBloc`.
- `test/data/services/api_service_test.dart`: Tests for the `ApiService`.
- `test/presentation/screens/dropdown_screen_test.dart`: Tests for the `DropdownScreen`.
- `test/presentation/widgets/custom_dropdown_widget_test.dart`: Tests for the `CustomDropdown` widget.

## Setup and Running the App

1. Clone the repository: ```git clone https://github.com/Appvala/flutter_coding_challenge.git```

2. Navigate to the project directory: ```cd flutter_coding_challenge```

3. Install dependencies:```flutter pub get```

4. Run the app: ```flutter run```

## Running Tests

To run the tests, use the following command: ```flutter test```

## Conclusion

The Flutter Dropdown App demonstrates the use of the `flutter_bloc` package
for state management and custom widgets to create a responsive and
maintainable Flutter application. The architecture is modular,
separating concerns across different layers, making the app easy to extend
and maintain. The included tests ensure that the app's functionality is verified
and reliable.