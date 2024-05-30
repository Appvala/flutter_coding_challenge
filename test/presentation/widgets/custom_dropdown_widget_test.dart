import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/presentation/widgets/custom_dropdown_widget.dart';
import 'package:flutter_coding_challenge/data/models/country.dart';

void main() {
  testWidgets('CustomDropdown displays items and handles selection',
      (WidgetTester tester) async {
    final items = [
      const CountryModel(id: 1, value: 'Country 1'),
      const CountryModel(id: 2, value: 'Country 2'),
    ];
    CountryModel? selectedItem;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomDropdown<CountryModel>(
            hint: 'Select Country',
            value: selectedItem,
            items: items,
            getItemLabel: (item) => item.value,
            getDropDownItemValue: (item) => item.id.toString(),
            onChanged: (item) {
              selectedItem = item;
            },
          ),
        ),
      ),
    );

    expect(find.text('Select Country'), findsOneWidget);

    // Tap on the dropdown button to open the menu
    await tester.tap(find.text('Select Country'));
    await tester.pumpAndSettle();

    // Scroll to ensure the item is visible
    await tester.scrollUntilVisible(find.text('Country 1'), 50);

    // Tap on the item
    await tester.tap(find.text('Country 1').last);
    await tester.pumpAndSettle();

    expect(selectedItem, isNotNull);
    expect(selectedItem!.value, 'Country 1');
  });
}
