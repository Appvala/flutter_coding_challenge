import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:flutter_coding_challenge/presentation/screens/dropdown_screen.dart';
import 'package:flutter_coding_challenge/presentation/screens/summary_screen.dart';
import 'package:flutter_coding_challenge/bloc/dropdown_bloc.dart';
import 'package:flutter_coding_challenge/bloc/dropdown_event.dart';
import 'package:flutter_coding_challenge/bloc/dropdown_state.dart';
import 'package:flutter_coding_challenge/data/models/country.dart';
import 'package:flutter_coding_challenge/data/models/state.dart';

class MockDropdownBloc extends MockBloc<DropdownEvent, DropdownState>
    implements DropdownBloc {}

void main() {
  group('DropdownScreen', () {
    late DropdownBloc dropdownBloc;

    setUp(() {
      dropdownBloc = MockDropdownBloc();
    });

    tearDown(() {
      dropdownBloc.close();
    });

    testWidgets('displays countries and states and navigates to SummaryScreen',
        (WidgetTester tester) async {
      const country = CountryModel(id: 1, value: 'Country 1');
      const state = StateModel(id: 1, value: 'State 1');

      whenListen(
        dropdownBloc,
        Stream.fromIterable([
          const DropdownState(countries: [country], states: null),
          const DropdownState(countries: [country], states: [state]),
        ]),
        initialState: const DropdownState(countries: [country], states: null),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: dropdownBloc,
            child: const DropdownScreen(),
          ),
          routes: {
            SummaryScreen.routeName: (context) => const SummaryScreen(),
          },
        ),
      );

      // Wait for the widget to rebuild
      await tester.pumpAndSettle();

      // Verify that the countries dropdown is displayed
      expect(find.text('Select Country'), findsOneWidget);

      // Open the country dropdown and select the country
      await tester.tap(find.text('Select Country'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Country 1').last);
      await tester.pumpAndSettle();

      // Verify that the states dropdown is displayed
      expect(find.text('Select State'), findsOneWidget);

      // Open the state dropdown and select the state
      await tester.tap(find.text('Select State'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('State 1').last);
      await tester.pumpAndSettle();

      // Ensure the "Submit" button is visible and tap it
      final submitButtonFinder = find.text('Submit');
      await tester.ensureVisible(submitButtonFinder);
      await tester.tap(submitButtonFinder);
      await tester.pumpAndSettle();
    });
  });
}
